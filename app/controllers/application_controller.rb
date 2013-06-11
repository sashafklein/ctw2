class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authenticate_admin!
    if user_signed_in? && admin?
      true
    else
      false
    end
  end

  def after_sign_in_path_for(resource)
		resource
	end

	def admin?
		current_user.admin?
	end
end
