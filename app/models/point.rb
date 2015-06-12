class Point < ActiveRecord::Base
  validates :status, presence: true,
                     inclusion: { in: %w(awarded redeemed)}
  enum status: %w(awarded redeemed)
end

