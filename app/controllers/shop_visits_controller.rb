class ShopVisitsController < ApplicationController
 def index
    
   @visits = current_user.visits.joins(:retailor_visits).where(retailor_visits: { user_id: current_user.id })
   @retailors = current_user.retailors
 end
end
