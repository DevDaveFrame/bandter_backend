class SongSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :album, :description, :duration
end
