class MatchChatChannel < ApplicationCable::Channel
  def subscribed
    match_chat = MatchChat.find(params[:match_chat_id])
    stream_for match_chat
    # stream_from "match_chat_channel"
  end

  def unsubscribed
    puts "HITTING IT"
  end

  def create(opts)
    Message.create(
      content: opts.fetch('content'),
      user_id: opts.fetch('user_id'),
      match_chat_id: opts.fetch('match_chat_id')
    )
  end
end
