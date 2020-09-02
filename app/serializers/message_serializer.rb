class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :match_chat_id, :user_id, :username, :content
end
