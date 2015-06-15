require 'rails_helper'

describe 'authorization', type: :feature do
  let(:user_1) {Fabricate(:user)}
  let(:user_2) {User.create!(username: "joe", password: "pass", password_confirmation: "pass")}
  let(:reward) {Fabricate(:reward)}
  before(:each) do
    ApplicationController.any_instance.stubs(:current_user).returns(user_1)
  end

  it 'does not allow a user to see another users dashboard' do
    visit user_path(user_2)

    expect(page).not_to have_content "#{user_2.username}"
  end

  it 'does not allow a user to access new reward path' do
    visit new_admin_reward_path

    expect(page).to have_content "The page you were looking for doesn't exist"
  end

  it 'does not allow a user to create or destroy points' do
    expect {visit admin_user_points_path(user_1)}.to raise_error(ActionController::RoutingError)
  end
end
