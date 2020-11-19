class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
    
  # 新規登録後のリダイレクト先をマイページへ
    def after_sign_in_path_for(resource)
      user_path(resource)
    end
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |user| user.permit(:name, :email, :password) }
    end
end
