Rails.application.routes.draw do
  root 'events#index'

  resources :rooms
  resources :events
end
