class Api::V1::UserGenresController < ApplicationController
  def create
    user_genres = []
    params[:user_genre][:genres].each do |genre|
      user_genres.push(UserGenre.create(user_id: params[:user_genre][:user_id], genre_id: genre))
    end
    genres = user_genres.map{|ug| Genre.find(ug.genre_id)}
    render json: genres
  end
end
