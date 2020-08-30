class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :bio, :location, :img_url, :seeking
  has_many :match_chats, object_method_name: :match_chats, serializer: MatchChatSerializer
end
