class AddUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin, only: [:new, :create]


 def dynamic_select_zones
    district = District.find(params[:district_id])
    zones = Zone.all

    render json: { zones: zones }
  end
def index
  @users = User.includes(:user_detail)
               .search(params[:search])  
               .page(params[:page])
               .per(10)
 
end



def new
  @user = User.new
  @user.build_user_detail
  @districts = District.all  
end

def create
  @user = User.new(user_params) 
  @user.build_user_detail(user_params[:user_detail_attributes]) if user_params[:user_detail_attributes]
  if @user.save!
    flash[:notice] = "User created successfully."
    redirect_to add_users_path(@add_user)
  else
    flash.now[:alert] = @user.errors.full_messages.join(", ")
    render :new
  end
end

  private

def user_params
  params.require(:user).permit(:email, :password, :password_confirmation, user_detail_attributes: [:first_name,:district_id, :zone_id ,:last_name, :role_id])
 end

  def check_if_admin
    unless current_user.admin?
      flash[:alert] = "You do not have permission to create users."
      redirect_to root_path
    end
  end
end
