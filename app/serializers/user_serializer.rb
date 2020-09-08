class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :first_name, :last_name, :bio, :location, :img_url, :narrative, :genres, :instruments, :friends, :friend_requests, :pending_requests
  has_many :match_chats, serializer: MatchChatSerializer
  has_many :songs, serializer: SongSerializer
end
