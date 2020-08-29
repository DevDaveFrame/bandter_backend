class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :bio, :location, :img_url, :seeking
  has_many :messages
end
