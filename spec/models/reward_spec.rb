require 'rails_helper'

RSpec.describe Reward, type: :model do
    let(:reward) { Fabricate(:reward) }

    it 'is valid' do
      expect(reward).to be_valid
    end

    it 'is invalid without a title' do
      reward.title = nil
      expect(reward).not_to be_valid
    end

    it 'is invalid without a description' do
      reward.description = nil
      expect(reward).not_to be_valid
    end

    it 'is invalid without a cost' do
      reward.cost = nil
      expect(reward).not_to be_valid
    end

    it 'must have a whole number value for cost' do
      reward.cost = 1.23
      expect(reward).not_to be_valid
    end

  end

