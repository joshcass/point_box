class Reward < ActiveRecord::Base
  extend FriendlyId
  has_many :purchases
  has_many :users, through: :purchases
  validates :title, :description, presence: true
  validates :title, uniqueness: true
  validates :cost, presence: true,
                   numericality: { only_integer: true }
  friendly_id :title, use: :slugged
end

