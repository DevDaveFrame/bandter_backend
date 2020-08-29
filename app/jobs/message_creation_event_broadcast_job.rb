class MessageCreationEventBroadcastJob < ApplicationJob
    queue_as :default
  
    def perform(message)
      ActionCable
        .server
        .broadcast('match_chat_channel',
          user_id: message.user_id,
          match_chat_id: message.match_chat_id,
          created_at: message.created_at.strftime('%I:%M:%S %p'),
          content: message.content)
    end
  end