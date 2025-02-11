module DynamicSelect
  class ZonesController < ApplicationController
    def index
      @zones = Zone.all
    end
 def new
  @zone = Zone.new
end
   
  def create
      unless current_user&.admin?
        flash[:alert] = "You are not authorized to create a zone."
        redirect_to root_path and return
      end
      
      @zone = Zone.new(zone_params)
      
      # Generate a random 5-digit unique code
      @zone.unique_code = rand(10000..99999).to_s
      
      if @zone.save
        flash[:notice] = "Zone created successfully."
        redirect_to dynamic_select_zones_path
      else
        flash[:alert] = "Error creating zone: #{@zone.errors.full_messages.join(', ')}"
        render :new
      end
    end


private

    # Strong parameters for creating a Zone
    def zone_params
      params.require(:zone).permit(:name, :district_id, :unique_code)
    end
  end
end
