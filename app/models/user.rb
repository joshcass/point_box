class User < ActiveRecord::Base
  extend FriendlyId
  has_many :points
  has_many :purchases
  has_many :rewards, through: :purchases
  validates :username, presence: true,
                       uniqueness: true
  friendly_id :username, use: :slugged
end
