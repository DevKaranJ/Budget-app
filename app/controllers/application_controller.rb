class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_up_path_for(_resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password profile_pic])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email password current_password profile_pic])
  end
end
