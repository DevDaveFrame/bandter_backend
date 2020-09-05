class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :first_name, :last_name, :bio, :location, :profile_picture, :img_url, :narrative, :genres, :instruments
  has_many :match_chats, serializer: MatchChatSerializer
end
