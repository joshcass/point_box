require 'rails_helper'

RSpec.describe Point, type: :model do
  let(:point) { Point.create }

  it 'is valid' do
   expect(point).to be_valid
  end

  it 'is invalid wihout a status' do
    point.status = nil
    expect(point).not_to be_valid
  end

  it 'can only have a status of awarded or redeemed' do
    expect { point.status = "superfun" }.to raise_error(ArgumentError)
  end

  it 'belongs to a user' do
    expect(point).to respond_to(:user)
  end
end
