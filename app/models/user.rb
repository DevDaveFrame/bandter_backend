class User < ApplicationRecord
  has_one_attached :profile_picture
  has_many :offered_matches, foreign_key: :friendee_id, class_name: 'MatchChat'
  has_many :frienders, through: :offered_matches

  has_many :initiated_matches, foreign_key: :friender_id, class_name: 'MatchChat'
  has_many :friendees, through: :initiated_matches

  has_many :song_genres, through: :songs, class_name: 'Genre'
  has_many :taste_genres, through: :user_genres, class_name: 'Genre'
  
  has_many :instruments, through: :user_instruments
  has_many :songs

  has_many :messages

  # NAME VALIDATIONS
  validates :first_name,  presence: true, length: { maximum: 30 }
  validates :last_name,  presence: true, length: { maximum: 30 }
  
  # EMAIL VALIDATIONS
  before_save { self.email = email.downcase } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, :on => :create,
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  
  # PASSWORD VALIDATIONS
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, :on => :create

      def name
        self.firstname + " " + self.lastname
      end

      def matches
        self.frienders + self.friendees
      end
    
      def match_chats
        self.offered_matches + self.initiated_matches
      end

      def match_chat_ids
        self.match_chats.map{ |match_chat| match_chat.id }
      end
    
      def friend_requests
        self.offered_matches.where(accepted == false)
      end

      def genres
        self.song_genres + self.taste_genres
      end
end

