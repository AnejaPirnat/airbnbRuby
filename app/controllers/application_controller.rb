class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
protect_from_forgery  with: :exception
skip_before_action :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }
 
protected
      
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end

