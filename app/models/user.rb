class User < ApplicationRecord
  has_many :offered_matches, foreign_key: :friendee_id, class_name: 'MatchChat'
  has_many :frienders, through: :offered_matches

  has_many :initiated_matches, foreign_key: :friender_id, class_name: 'MatchChat'
  has_many :friendees, through: :initiated_matches

  has_many :songs
  has_many :genres, through: :songs
  has_many :messages
  has_many :match_chats

  # NAME VALIDATIONS
  validates :name,  presence: true, length: { maximum: 50 }
  
  # EMAIL VALIDATIONS
  before_save { self.email = email.downcase } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, :on => :create,
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  
  # PASSWORD VALIDATIONS
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, :on => :create

      def matches
        self.frienders + self.friendees
      end
    
      def match_chats
        self.offered_matches + self.initiated_matches
      end
    
      def friend_requests
        self.offered_matches.where(accepted == false)
      end
end

