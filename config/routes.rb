Rails.application.routes.draw do
  resources :rewards , only: [:index, :show] do
    post '/purchases', to: 'purchases#create'
  end

  resources :users, except: [:index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :rewards
    resources :users do
      post '/points', to: 'points#create'
      delete '/points', to: 'points#destroy'
    end
  end

  root to: 'rewards#index'
end
