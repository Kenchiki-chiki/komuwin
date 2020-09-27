Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :schedules
  root to: 'schedules#index'
  resources :texts
  resources :movies
  resources :interview_sheets
  resources :documents
end
