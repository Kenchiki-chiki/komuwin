Rails.application.routes.draw do
  devise_for :users
  resources :schedules
  root to: 'schedules#index'
end
