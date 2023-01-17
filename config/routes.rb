Rails.application.routes.draw do
  devise_for :users
  resources :applicants
  resources :jobs
  root 'jobs#index'
  get 'applicants/storedata', to: 'applicants#storedata'
end
