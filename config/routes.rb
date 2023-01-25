Rails.application.routes.draw do
  devise_for :users
  resources :applied_jobs do
    collection do
      get :display
      get :myjob
      get :subscribe
    end
  end
  resources :jobs do 
    collection do 
      get :all_user
      get :applicant
    end
  end
  # root to:'registration#sign_up'
  devise_scope :user do
   root to: "devise/registrations#new"
  end
  
end
