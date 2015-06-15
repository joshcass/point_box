require 'rails_helper'

describe 'user login', type: :feature do
  let(:user) {Fabricate(:user)}

  it 'allows a user to login' do
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(user_path(user))
  end
end
