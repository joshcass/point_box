class Point < ActiveRecord::Base
  belongs_to :user
  validates :status, presence: true,
                     inclusion: { in: %w(awarded redeemed)}
  enum status: %w(awarded redeemed)
end

