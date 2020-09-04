class Song < ApplicationRecord
  has_one_attached :audio

  belongs_to :user
  belongs_to :genre
end
