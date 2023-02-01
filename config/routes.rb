Rails.application.routes.draw do
  devise_for :users
  get '/interviews/new/:user_id/:job_id', to: 'interviews#new', as: 'new_interview'
  resources :interviews, only: [:show, :new, :create]
  

  resources :interviews do
    collection do
      get :new
    end
  end
  resources :interviews do
    member do
      get :edit
      patch :update
    end
  end
  
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
