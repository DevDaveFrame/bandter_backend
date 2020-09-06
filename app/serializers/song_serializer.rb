class SongSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description, :duration
end
