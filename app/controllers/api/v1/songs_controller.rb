class Api::V1::SongsController < ApplicationController
  skip_before_action :logged_in?, only: [:create, :update]
  def create
    song = Song.new(user_id: params[:user_id], genre_id: 860)
    song.save
    song.audio.attach(params[:audio])
    render json: {message: "SUPER DEE DUPER!"}
  end

  def show
    song = Song.find(params[:id])
    render 
end
