Rails.application.routes.draw do
  resources :points, only: [:create, :destroy]
  resources :rewards
end
