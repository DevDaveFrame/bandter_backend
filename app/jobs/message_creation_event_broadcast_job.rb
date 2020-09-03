class MessageCreationEventBroadcastJob < ApplicationJob
    queue_as :default
  
    def perform(message)
      match_chat = MatchChat.find(message.match_chat_id)
      MatchChatChannel.broadcast_to(match_chat, MessageSerializer.new(message))
    end
  end