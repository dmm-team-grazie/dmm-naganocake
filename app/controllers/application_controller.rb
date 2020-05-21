class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_top_path
    when Member
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Admin
      new_admin_session_path
    when Member
      root_path
    end
  end

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_kana_name,:first_kana_name,:email,:postal_code,:address,:phone_number])
   devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
   devise_parameter_sanitizer.permit(:account_update,keys:[:last_name,:first_name,:last_kana_name,:first_kana_name,:email,:postal_code,:address,:phone_number])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
  end
  
end
