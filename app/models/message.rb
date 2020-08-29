class Message < ApplicationRecord
  belongs_to :user
  belongs_to :match_chat

  after_create_commit do
    MessageCreationEventBroadcastJob.perform_later(self)
  end

end
