class User < ActiveRecord::Base
  extend FriendlyId
  has_many :points
  validates :username, presence: true,
                       uniqueness: true
  friendly_id :username, use: :slugged
end
