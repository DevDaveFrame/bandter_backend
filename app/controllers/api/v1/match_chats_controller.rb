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

  def friending
    existing_match = MatchChat.where(friender_id: params[:friender_id], friendee_id: params[:friendee_id])
    .or(MatchChat.where(friender_id: params[:friendee_id], friendee_id: params[:friender_id]))[0]
    if existing_match == nil
      requested_match = MatchChat.create(friender_id: params[:friender_id], friendee_id: params[:friendee_id], accepted: false)
    else
      existing_match.update(accepted: true)
      requested_match = existing_match
    end
    byebug
    render json: MatchChatSerializer.new(requested_match).serializable_hash
  end

end
