class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create,:destroy]
  
#   def new 
#   super
# end
  def create
    # Find the user by email instead of login
    user = User.find_by(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      # Proceed with login if user is found
      super
    else
      flash[:alert] = "Invalid email or password."
      redirect_to new_user_session_path
    end
  end


    def destroy
      
      super
    end
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:remember_me, :timestamp, :timestamp_count, user: [:email, :password]])
  end
end




