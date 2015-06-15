require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { Fabricate(:user) }

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a username' do
    user.username = nil
    expect(user).not_to be_valid
  end

  it 'has points' do
    expect(user).to respond_to(:points)
  end

  it 'has rewards' do
    expect(user).to respond_to(:rewards)
  end
end

