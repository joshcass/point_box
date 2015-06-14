class User < ActiveRecord::Base
  extend FriendlyId
  has_many    :points,    dependent:  :destroy
  has_many    :purchases, dependent:  :destroy
  has_many    :rewards,   through:    :purchases
  validates   :username,  presence:   true,
                          uniqueness: true
  friendly_id :username,  use:        :slugged
  has_secure_password
  enum role: %w(default admin)

  def awarded_total
    points.awarded.count
  end

  def redeemed_total
    points.redeemed.count
  end

  def points_total
    points.count
  end

  def redeem(cost)
    points.awarded.limit(cost).update_all(status: points.statuses[:redeemed])
  end
end
