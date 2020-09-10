class Api::V1::PhotosController < ApplicationController
  skip_before_action :logged_in?, only: [:create, :update]
  def create
    photo = Photo.create(user_id: params[:user_id])
    photo.content.attach(params[:content])
    url = url_for(photo.content)
    photo.update(img_url: url)
    render json: PhotoSerializer.new(photo).serializable_hash
  end

  def show
    photo = photo.find(params[:id])
  end
end
