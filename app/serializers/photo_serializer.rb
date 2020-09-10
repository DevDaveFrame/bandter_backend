class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description, :img_url
end
