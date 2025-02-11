class RetailorUsersController < ApplicationController
  def new
    @salesman_role = Role.find_by(name: 'Salesman')  # Find the role ID for "Salesman"
    @users = User.joins(:user_detail).where(user_details: { role_id: @salesman_role.id }) # Fetch all users
    @retailors = Retailor.select(:id, :shop_name) 
    @retailor_user = RetailorUser.new
    @districts = District.all
    @zones = Zone.all
  end

def create
  # Loop through each selected retailor_id and create a new retailor_user record
  params[:retailor_user][:retailors_id].each do |retailor_id|
    # Create the retailor_user record for each selected retailor
    RetailorUser.create(
      user_id: params[:retailor_user][:user_id],
      retailor_id: retailor_id, # Assuming retailor_id is a foreign key in the retailor_users table
      district_id: params[:retailor_user][:district_id],
      zone_id: params[:retailor_user][:zone_id]
    )
  end

  redirect_to retailor_users_path, notice: 'Retailors assigned successfully.'
end
 def get_by_zone
    zone_id = params[:zone_id]
    @retailors = Retailor.where(zone_id: zone_id).select(:id, :shop_name)

    render json: @retailors
  end
def index
    
    @retailor_users = RetailorUser.all # Or any specific logic for fetching retailor users

    @districts = District.all
    @zones = Zone.all
 end
  
   def assign_task
  @retailor_user = RetailorUser.find(params[:id])
  if @retailor_user.update(task_ids: params[:task_ids]) # Adjust as per your model's setup
    redirect_to retailor_users_path, notice: "Tasks successfully assigned."
  else
    redirect_to edit_retailor_user_path(@retailor_user), alert: "Failed to assign tasks."
  end
  end

  private

  # def retailor_user_params
  #   params.require(:retailor_user).permit(task_ids: [])
  # end

end
