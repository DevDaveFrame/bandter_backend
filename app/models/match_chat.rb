class MatchChat < ApplicationRecord
  belongs_to :friender, class_name: 'User'
  belongs_to :friendee, class_name: 'User'
  has_many :messages, dependent: :destroy

  def friender_name
    user = User.find(self.friender_id)
    user.name
  end
  def friendee_name
    user = User.find(self.friendee_id)
    user.name
  end
  def friender_img
    user = User.find(self.friender_id)
    user.img_url
  end
  def friendee_img
    user = User.find(self.friendee_id)
    user.img_url
  end

  def user_ids
    [self.friender_id, self.friendee_id]
  end

end
