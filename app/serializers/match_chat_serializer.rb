class MatchChatSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :friender_id, :friendee_id, :accepted, :friender_name, :friendee_name, :friender_img, :friendee_img, :messages
  has_many :messages, serializer: MessageSerializer
  belongs_to :friender, record_type: :user
  belongs_to :friendee, record_type: :user

end
