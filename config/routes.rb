Rails.application.routes.draw do
 devise_for :users
 root to: 'items#index'
 resources :items, only: [:index,:new,:create,:show,:edit,:update,:destroy] do
 end
 resources :buys, only: [:index] do
  resources :shipping_destinations, only: [:index]
 end
end
