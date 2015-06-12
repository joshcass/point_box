Rails.application.routes.draw do
  resources :rewards
  resources :users do
    resources :points, only: [:create]
    delete '/points', to: 'points#destroy'
  end
end
