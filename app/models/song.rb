class Song < ApplicationRecord
  has_one_attached :audio

  belongs_to :user
  belongs_to :genre

  def duration
    audio.blob.metadata[:duration] if audio.attached?
  end
end
