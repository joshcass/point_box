class Reward < ActiveRecord::Base
  extend FriendlyId
  has_many    :purchases,   dependent:    :destroy
  has_many    :users,       through:      :purchases
  validates   :description, presence:     true
  validates   :title,       uniqueness:   true,
                            presence:     true
  validates   :cost,        presence:     true,
                            numericality: { only_integer: true }
  friendly_id :title,       use:          :slugged
end

