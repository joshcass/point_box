require 'rails_helper'

describe 'admin views', type: :feature do
  let(:admin) {User.create(username: "hansolo", password: "password", password_confirmation: "password", role: 1)}
  before(:each) do
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
  end
  context 'rewards' do
    let(:reward) {Fabricate(:reward)}

    it 'allows an admin to create a new reward' do
      visit new_admin_reward_path
      fill_in "Title", with: "title"
      fill_in "Description", with: "description"
      fill_in "Cost", with: 5
      click_button "Create Reward"

      expect(current_path).to eq '/admin/rewards/title'
      expect(page).to have_content 'title'
    end

    it 'allows an admin to edit a reward' do
      visit admin_reward_path(reward)
      click_on "Edit"
      fill_in "Title", with: "title"
      fill_in "Description", with: "description"
      fill_in "Cost", with: 5
      click_button "Update Reward"

      expect(page).to have_content 'title'
      expect(page).to have_content 'description'
      expect(page).to have_content 'Cost: 5 points'
    end

    it 'allows an admin to delete a reward' do
      visit admin_reward_path(reward)
      click_on "Delete"

      expect(current_path).to eq admin_rewards_path
      expect('#ul').not_to have_content(reward.title)
    end

    context 'points' do
      let(:user) {Fabricate(:user)}

      it 'allows an admin to award a user points' do
        visit admin_user_path(user)
        within '#award_points_form' do
          fill_in "Award Points", with: 6
          click_button "Award"
        end
        expect(page).to have_content 'Current Point Total: 6'
      end

      it 'allows and admin to retract a users points' do
        user.points.create
        user.points.create
        visit admin_user_path(user)
        within '#retract_points_form' do
          fill_in "Retract Points", with: 1
          click_button "Retract"
        end
        expect(page).to have_content 'Current Point Total: 1'
      end
    end
  end
end
