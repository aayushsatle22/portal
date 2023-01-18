Rails.application.routes.draw do
  devise_for :users
  resources :applied_jobs
  resources :jobs
  root 'jobs#index'
  get 'applied_jobs/display'
end
