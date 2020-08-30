class MatchChatSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :friender_id, :friendee_id, :accepted, :friender_name, :friendee_name, :friender_img, :friendee_img
  has_many :messages
  belongs_to :friender, record_type: :user
  belongs_to :friendee, record_type: :user
  
  def friender_name
    user = User.find(friender_id)
    user.name
  end
  def friendee_name
    user = User.find(friendee_id)
    user.name
  end
  def friender_img
    user = User.find(friender_id)
    user.img_url
  end
  def friendee_img
    user = User.find(friendee_id)
    user.img_url
  end

end
