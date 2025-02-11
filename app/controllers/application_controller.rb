class ApplicationController < ActionController::Base
   before_action :authenticate_user!  
 

def after_sign_in_path_for(resource)
    authenticated_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    unauthenticated_root_path
  end

  def authorize_admin!
    unless current_user.roles.exists?(name: 'admin')
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to unauthenticated_root_path
    end
  end
 
end
