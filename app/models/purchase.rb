class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward
  validates  :user_id, :reward_id, presence: true

  def execute
    if user.awarded_total >= reward.cost
      user.redeem(reward.cost)
      self.save
    else
      false
    end
  end
end

