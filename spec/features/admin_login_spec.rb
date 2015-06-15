require 'rails_helper'

describe 'admin login', type: :feature do
  let(:admin) {User.create(username: "hansolo", password: "password", password_confirmation: "password", role: 1)}
  it 'logs in an admin' do
    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(admin_users_path)
  end
end
