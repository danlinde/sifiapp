class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :nag_user_for_email  

  protected

  def after_sign_in_path_for(organizer)
    organizer_path(organizer)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def nag_user_for_email
  	if current_organizer && current_organizer.email.blank?
		  redirect_to '/authentications/get_email'
	  end
  end

end
