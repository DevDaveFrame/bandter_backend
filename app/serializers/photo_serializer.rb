class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_id, :description, :img_url
end
