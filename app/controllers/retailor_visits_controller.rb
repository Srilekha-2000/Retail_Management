class RetailorVisitsController < ApplicationController
  def index
    @retailor_visits = RetailorVisit.all
    @users = User.all
    @districts = District.all
    @zones = Zone.all
    @retailors = Retailor.all
    @visits = Visit.all
  end

  def new
    @salesman_role = Role.find_by(name: 'Salesman')
    @users = User.joins(:user_detail).where(user_details: { role_id: @salesman_role.id })
    # @retailors = Retailor.select(:id, :shop_name)
   
    @districts = District.all
    @zones = Zone.all
    @visits = Visit.all
     @retailor_visit = RetailorVisit.new
    @retailors = Retailor.all
  end

  def create
  # Fetching parameters for RetailorVisit
  @retailor_visit = RetailorVisit.new(retailor_visit_params)

  # Step 1: Create the Visit object with the correct parameters
  @visit = Visit.new(date_of_time: Time.now)  # Or any other fields you need to pass

  # Step 2: Save Visit first
  if @visit.save
    # Step 3: Associate the saved visit with the retailor visit
    @retailor_visit.visit_id = @visit.id  # Ensure the retailor visit knows which visit to associate with

    # Step 4: Save RetailorVisit
    if @retailor_visit.save
      redirect_to @retailor_visit, notice: "Retailor visit and visit created successfully."
    else
      @visit.destroy  # Rollback the visit if retailor visit fails
      render :new, alert: "Failed to create RetailorVisit."
    end
  else
    render :new, alert: "Failed to create Visit."
  end
end
 def get_by_zone
    zone_id = params[:zone_id]
    @retailors = Retailor.where(zone_id: zone_id).select(:id, :shop_name)
    render json: @retailors
  end
private

def visit_params
  # If you want to permit specific fields for Visit, update this method
  params.require(:retailor_visit).permit(:date_of_time)
end
def retailor_visit_params
  params.require(:retailor_visit).permit(:retailor_id, :status, :activity, :user_id)
end


 

 
end
