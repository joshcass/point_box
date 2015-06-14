class Point < ActiveRecord::Base
  belongs_to :user
  validates  :status, presence:  true,
    inclusion: { in: %w(awarded redeemed)}
  enum status: %w(awarded redeemed)

  def self.award(quantity)
    quantity.to_i.times { self.create }
  end

  def self.retract(quantity)
    self.awarded.limit(quantity).destroy_all
  end
end

