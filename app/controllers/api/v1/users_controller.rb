class Api::V1::UsersController < ApplicationController
  skip_before_action :logged_in?, only: [:create, :update]
  before_action :find_user, only: [:show, :update]
  
  def index
    users = User.all 
    render json: UserSerializer.new(users).serializable_hash
  end
  
  def create
    user = User.new(user_params)
    if user.save
      options = {include: [:match_chats, :songs, :photos]}
      render json: {user: UserSerializer.new(user, options).serializable_hash, token: encode_token({user_id: user.id})}
    else
      render json: {errors: "OH NO! > o < "}
    end
  end

  def show
    user = User.find(params[:id])
    options = {include: [:match_chats, :songs, :photos]}
    render json: {user: UserSerializer.new(user, options).serializable_hash, token: encode_token({user_id: user.id})}
  end

  def update

    user = User.find(params[:id])
    if params[:profile_picture]
      user.profile_picture.attach(params[:profile_picture])
      photo = url_for(user.profile_picture)
      user.update(img_url: photo)
      render json: {user: UserSerializer.new(user).serializable_hash, token: encode_token({user_id: user.id})}
    else
      user.update(user_params)
      render json: {user: UserSerializer.new(user).serializable_hash, token: encode_token({user_id: user.id})}
    end
  end

  def query
    if params[:genreFilters].length > 0 || params[:instrumentFilters].length > 0
      genre_filtered_users = User.all.select{|user| (user.genre_ids & params[:genreFilters]).any? }
      inst_filtered_users = User.all.select{|user| (user.instrument_ids & params[:instrumentFilters]).any? }
      filtered_users = genre_filtered_users + inst_filtered_users
    else 
      filtered_users = User.all
    end
    render json: filtered_users, only: [:id, :first_name, :last_name, :bio, :img_url], include: [:songs, :genres, :instruments]
  end

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_picture, :email, :password, :password_confirmation, :narrative, :bio, :location, :img_url)
  end

  def find_user
    user = User.find(params[:id])
  end

end
