require 'rails_helper'

describe 'user views', type: :feature do
  let(:user) {Fabricate(:user)}
  let(:reward) {Fabricate(:reward)}
  before(:each) do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
  end
  context 'rewards' do
    it 'allows a user with enough points to purchase a reward' do
      user.points.create
      visit reward_path(reward)
      click_on "Purchase"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content 'Current Point Total: 0'
      expect(page).to have_content 'Total Points Spent: 1'
      expect(page).to have_link "#{reward.title}", href: reward_path(reward)
    end

    it 'does not allow a user without enough points to purchase a reward' do
      visit reward_path(reward)
      click_on "Purchase"
      visit user_path(user)

      expect(page).to have_content 'Current Point Total: 0'
      expect(page).to have_content 'Total Points Spent: 0'
      expect(page).not_to have_link "#{reward.title}", href: reward_path(reward)
    end
  end
end
