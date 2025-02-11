class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  # Only allow admin users to register other users
  def new
    @user = User.new
    @user.build_user_detail # Build nested user details if necessary
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      flash[:notice] = "User created successfully."
     redirect_to new_user_registration_path# Redirect to the admin users list or appropriate path
    else
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      user_detail_attributes: [
        :role_id,
        :state_id,
        :district_id,
        :first_name,
        :middle_name,
        :last_name,
        :gender,
        :date_of_birth,
        :proof_of_id,
        :id_proof_details,
        :building_name,
        :flat_no,
        :road,
        :block_sector,
        :post_office,
        :state,
        :village_or_city
      ]
    )
  end
end
