class Reward < ActiveRecord::Base
  extend FriendlyId
  validates :title, :description, presence: true
  validates :title, uniqueness: true
  validates :cost, presence: true,
                   numericality: { only_integer: true }
  friendly_id :title, use: :slugged
end

