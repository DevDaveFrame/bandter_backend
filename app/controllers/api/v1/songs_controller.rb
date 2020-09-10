class Api::V1::SongsController < ApplicationController
  skip_before_action :logged_in?, only: [:create, :update]
  def create
    song = Song.create(user_id: params[:user_id], title:params[:title], album:params[:album])
    song.audio.attach(params[:audio])
    url = url_for(song.audio)
    song.update(description: url)
    render json: SongSerializer.new(song).serializable_hash
  end

  def show
    song = Song.find(params[:id])
  end
end
