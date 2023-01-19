class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

    before_action :update_allowed_parameters, if: :devise_controller?
     before_action :authenticate_user!

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password, :role)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password,:role)}
  end

  def after_sign_in_path_for(resource)
       
    if resource.role == "admin"
      jobs_path
    elsif resource.role == "user"
      applied_jobs_path
      
   else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
  new_user_session_path
  end
   
   def after_sign_up_path_for(resource) 
    
    new_user_session_path
   end 
   def create
    super
    if resource.persisted?
      sign_in(resource)
      redirect_to new_user_session_path
    end
  end
   
end