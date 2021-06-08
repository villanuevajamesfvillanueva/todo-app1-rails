class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    # protect_from_forgery with: :exception
    # protect_from_forgery prepend: true
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    before_action :set_current_user

    def set_current_user
          User.current = current_user
    end

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
          end
end
