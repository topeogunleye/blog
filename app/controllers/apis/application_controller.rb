class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery prepend: true

  before_action :authenticate_user!
  before_action :authenticate_user!, unless: :api_path

  before_action :update_allowed_parameters, if: :devise_controller?

@@ -13,4 +13,8 @@ def update_allowed_parameters
      u.permit(:name, :bio, :email, :password, :current_password)
    end
  end

  def api_path
    request.original_url.include?('api')
  end
end
