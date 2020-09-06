class Api::V1::GenresController < ApplicationController
  skip_before_action :logged_in?, only: [:index, :update]
  def index
    genres = Genre.all
    render json: genres, only: [:id, :name]
  end
end
