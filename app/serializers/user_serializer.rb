class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :first_name, :last_name, :bio, :location, :img_url, :seeking, :genres, :instruments
  has_many :match_chats, serializer: MatchChatSerializer
end
