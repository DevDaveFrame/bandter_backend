class Genre < ApplicationRecord
  has_many :songs
  has_many :users, through: :user_genres
end
