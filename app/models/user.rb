class User < ApplicationRecord
  has_one_attached :profile_picture
  has_many :offered_matches, foreign_key: :friendee_id, class_name: 'MatchChat'
  has_many :frienders, through: :offered_matches

  has_many :initiated_matches, foreign_key: :friender_id, class_name: 'MatchChat'
  has_many :friendees, through: :initiated_matches
  
  has_many :messages
  has_many :songs
  has_many :user_genres

  has_many :song_genres, through: :songs, source: :genre, class_name: 'Genre'
  has_many :taste_genres, through: :user_genres, source: :genre, class_name: 'Genre'
  
  has_many :user_instruments
  has_many :instruments, through: :user_instruments


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
        self.first_name + " " + self.last_name
      end

      def match_chats
        self.offered_matches.where(accepted: true) + self.initiated_matches.where(accepted: true)
      end
      
      def friends
        friender_ids = self.match_chats.map{|match| match.friender_id}
        friendee_ids = self.match_chats.map{|match| match.friendee_id}
        all_ids = friender_ids + friendee_ids
        friend_ids = all_ids.uniq.select{|id| id != self.id}
        friends = friend_ids.map{|id| User.find_by(id: id)}
        friends.map{|friend| {id: friend.id, name: friend.name, img_url: friend.img_url}}
      end

      def match_chat_ids
        self.match_chats.map{ |match_chat| match_chat.id }
      end
    
      def friend_requests
        self.offered_matches.where(accepted: false)
      end

      def pending_requests
        self.initiated_matches.where(accepted: false)
      end 

      def genres
        self.song_genres + self.taste_genres
      end

      def genre_ids
        self.genres.map { |genre| genre.id }
      end
end

