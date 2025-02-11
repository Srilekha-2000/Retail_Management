class VisitsController < ApplicationController

def index
    @visits = Visit.all
    @retailor_visits = RetailorVisit.order(created_at: :desc)
end

 def new
  @visit = Visit.new
  @visit.retailor_visits.build 
  @retailors = Retailor.all
  @users = User.joins(:user_detail).where(user_details: { role_id: Role.find_by(name: 'Salesman')&.id })
  @zones = Zone.all
  @districts = District.all
end



def create
  @visit = Visit.new(visit_params)
  @visit.user_id = params[:visit][:user_id]

  if @visit.zone_id.present?
    @district_id = Zone.find_by(id: @visit.zone_id)&.district_id
  end

  @visit.retailor_visits.each { |rv| rv.user_id ||= @visit.user_id } if @visit.retailor_visits.any?

  if @visit.save!
    params[:visit][:retailor_ids]&.each { |retailor_id| @visit.retailor_visits.create(retailor_id: retailor_id) }
    redirect_to visits_path, notice: "Visit successfully created!"
  else
     @retailors = Retailor.all
     render :new
   end
 end


  # def fetch_zones
  #   @zones = Zone.where(id: District.find_by(id: params[:district_id])&.zone_id)
  #   render json: @zones
  # end
  # def by_zone
  #   @retailors = Retailor.where(zone_id: params[:zone_id])
  #   render json: { retailors: @retailors.map { |retailor| { id: retailor.id, shop_name: retailor.shop_name } } }
  # end


private

 def visit_params
   params.require(:visit).permit(
    :date_of_time, 
    :zone_id, 
    :user_id, 
    :order_status,
    :visit_token,
    retailor_visits_attributes: [:retailor_id, :visit_id, :user_id, :visiting_time, activity: []]
   ).tap do |whitelisted|
    whitelisted[:retailor_visits_attributes]&.each_value do |rv|  
      if rv[:activity].is_a?(Array)
        rv[:activity].reject!(&:blank?)  
       end
     end
   end
 end


end
