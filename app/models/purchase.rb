class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward
  validates :user_id, :reward_id, presence: true
end
