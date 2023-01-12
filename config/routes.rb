Rails.application.routes.draw do
  devise_for :users
  root to: 'jobs#index'
  resources :jobs
  get '/api' ,to: "jobs#get_data"
  
end
