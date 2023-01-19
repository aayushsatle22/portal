Rails.application.routes.draw do
  devise_for :users
  resources :applied_jobs do
    collection do
      get :display
    end
  end
  resources :jobs
  # root to:'registration#sign_up'
  devise_scope :user do
   root to: "devise/registrations#new"
  end
  
end
