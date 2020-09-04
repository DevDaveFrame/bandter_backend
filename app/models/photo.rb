class Photo < ApplicationRecord
  has_one_attached :content
  belongs_to :user

end
