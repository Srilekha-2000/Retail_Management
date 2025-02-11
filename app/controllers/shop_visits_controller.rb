class ShopVisitsController < ApplicationController
 def index
    @retailor_visits = RetailorVisit.all 
   @visits = current_user.visits.joins(:retailor_visits).where(retailor_visits: { user_id: current_user.id })
   @retailors = current_user.retailors
 end
end
