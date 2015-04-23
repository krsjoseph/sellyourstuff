class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :require_login

# # This method is called after the user logs in
#   def after_sign_in_path_for(user)
#     # At this point check for first time login if required
#     root_path
#   end
#
#   private
#
#   def require_login
#     redirect_to login_url unless current_user
#   end
end