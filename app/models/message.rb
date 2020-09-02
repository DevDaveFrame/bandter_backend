class Message < ApplicationRecord
  belongs_to :user
  belongs_to :match_chat

  after_create_commit do
    MessageCreationEventBroadcastJob.perform_later(self)
  end

  def username
    user = User.find(self.user_id)
    return user.name
  end

end
