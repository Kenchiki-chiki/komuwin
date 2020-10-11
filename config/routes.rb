Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :users
  resources :schedules
  root to: 'schedules#index'
  resources :texts
  resources :movies
  resources :interview_sheets
  resources :documents do
    resource :corrections
  end
  resources :expected_questions
end
