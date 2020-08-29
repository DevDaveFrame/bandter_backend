class MatchChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "match_chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(opts)
    Message.create(
      content: opts.fetch('content'),
      user_id: opts.fetch('user_id'),
      match_chat_id: opts.fetch('match_chat_id')
    )
  end
end
