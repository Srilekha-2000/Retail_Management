class RetailorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @retailor_visits = RetailorVisit.all 
   @visits = current_user.visits.joins(:retailor_visits).where(retailor_visits: { user_id: current_user.id })
  @retailors = Retailor.where(user_id: current_user.id)
 end

  def new
    @retailor = Retailor.new
    @districts = District.all
  end
  def create
  @retailor = current_user.retailors.new(retailor_params) # Associate with the current user
 

  if @retailor.save!
    redirect_to new_retailor_path, notice: "Retailor created successfully."
  else
    flash.now[:alert] = "Failed to create Retailor. Please check the errors."
    render :new
  end
end
def get_zones
    district = District.find(params[:district_id])
    @zones = district.zones 
    render json: @zones
end
def by_zone
    @retailors = Retailor.where(zone_id: params[:zone_id])
    render json: { retailors: @retailors.map { |retailor| { id: retailor.id, shop_name: retailor.shop_name } } }

end

def edit_visit
  @visit = Visit.joins(:retailor_visits)
                .find_by(retailor_visits: { retailor_id: params[:retailor_id], user_id: current_user.id })
end

def update_visit
  @visit = Visit.joins(:retailor_visits)
                .find_by(retailor_visits: { retailor_id: params[:id], user_id: current_user.id })

  unless @visit
    flash[:error] = "Visit not found!"
    redirect_to retailors_path and return
  end

  if @visit.update(visit_params)
    if @visit.has_order?
      flash[:success] = "Please Place a new Order."
      redirect_to new_order_order_path
    else
      flash[:notice] = "No order placed."
      redirect_to retailors_path
    end
  else
    flash[:error] = "Failed to update visit record."
    render :edit_visit
  end
end
private
 def visit_params
  params.permit(:date_of_time, :user_id, :retailor_id, :status, :zone_id, :has_order, :reason)
end

  def retailor_params
  params.require(:retailor).permit(:shop_name, :owner_name, :address, :user_id, :mobile_number, :pin, :zone_id, :district_id)
end
end



  