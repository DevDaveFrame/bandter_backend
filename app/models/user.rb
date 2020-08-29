class User < ApplicationRecord
  has_many :friended_joins, foreign_key: :friendee_id, class_name: 'Friendship'
  has_many :frienders, through: :friended_joins

  has_many :friending_joins, foreign_key: :friender_id, class_name: 'Friendship'
  has_many :friendees, through: :friending_joins

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

      def friends
        self.frienders + self.friendees
      end
    
      def friendships
        self.friended_joins + self.friending_joins
      end
    
      def friend_requests
        self.friending_users.where(accepted == false)
      end
end

