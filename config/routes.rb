Rails.application.routes.draw do
  resources :rewards
  resources :users do
    post '/points', to: 'points#create'
    delete '/points', to: 'points#destroy'
  end
end
