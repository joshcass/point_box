require 'rails_helper'

class FakeSessionsController < ApplicationController
  skip_before_action :current_user?, only: [:new, :create]
  def create
    session[:user_id] = params[:user_id]
    redirect_to root_path
  end
end

describe 'the application', type: :feature do
  context 'when logged out' do
    before(:each) do
      visit root_path
    end

    it 'has a login link' do
      expect(page).to have_link("Login", href: login_path)
    end

    it 'does not have a logout link' do
      expect(page).not_to have_link("Logout", href: logout_path)
    end

    it 'has a create account link' do
      expect(page).to have_link("Create Account", href: new_user_path)
    end

    it 'is always redirected to the root path' do
      visit '/users/frank'
      expect(current_path).to eq rewards_path
    end
  end

  context 'when logged in' do
    let(:user) {Fabricate(:user)}

    before(:each) do
      Rails.application.routes.draw do
        root to: 'rewards#index'
        get '/fake_login', to: 'fake_sessions#create', as: :fake_login
        get 'login', to: 'sessions#create', as: :login
        delete 'logout', to: 'sessions#destroy', as: :logout
        resources :users, except: [:index]
        resources :rewards , only: [:index, :show] do
          post '/purchases', to: 'purchases#create'
        end
      end
      visit fake_login_path(user_id: user.id)
    end

    after(:each) do
      Rails.application.reload_routes!
    end

    it 'has a logout link' do
      expect(page).to have_link("Logout", href: logout_path)
    end

    it 'does not have a login link' do
      expect(page).not_to have_link("Login", href: login_path)
    end

    it 'does not have a create account link' do
      expect(page).not_to have_link("Create Account", href: new_user_path)
    end
  end
end
