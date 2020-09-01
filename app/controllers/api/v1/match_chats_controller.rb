class Api::V1::MatchChatsController < ApplicationController
  def index
    match_chats = MatchChat.all 
    render json: match_chats
  end 

  def show
    match_chat = MatchChat.find(params[:id])
    options = {include: [:messages]}
    render json: MatchChatSerializer.new(match_chat, options)
  end
end
