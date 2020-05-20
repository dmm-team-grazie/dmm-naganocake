class ApplicationController < ActionController::Base

  def taxed_price
    tax = 1.1
    return ((self.non_taxed_price * tax).round(2)).ceil
  end

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

end
