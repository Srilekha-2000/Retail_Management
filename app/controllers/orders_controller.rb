class OrdersController < ApplicationController
  def index
  if current_user.roles.exists?(name: "Admin")
    @orders = Order.all
    render :admin_index
  elsif current_user&.user_detail&.role&.name == "Salesman"
    @orders = Order.where(user_id: current_user.id)
    render :salesman_index
  else
    redirect_to unauthenticated_root_path, alert: "You are not authorized to view orders."
    return
  end
end

 def new_order
    @order = Order.new
    @order.order_skus.build
    @products = Product.all
   
  end
  def show
     @order = Order.find(params[:id])
    @products = Product.all 
  end
def create_order
  @order = Order.new(order_params)

  # 🔹 Fetch the latest visit for the given retailor_id and current user
  @visit = Visit.joins(:retailor_visits)
                .find_by(retailor_visits: { retailor_id: params[:id], user_id: current_user.id })

  if @visit.present?
    @order.visit_id = @visit.id
    @order.retailor_id = @visit.retailor_visits.first.retailor_id
  else
    flash[:alert] = "No visit found for the selected retailer. Please start a visit first."
    redirect_to new_visit_path and return
  end

  @order.user_id = current_user.id

  Rails.logger.debug "Creating Order with: User ID: #{@order.user_id}, Retailor ID: #{@order.retailor_id}, Visit ID: #{@order.visit_id}"

  if @order.save!
    redirect_to order_path(@order, retailor_id: @order.retailor_id), notice: 'Order was successfully created.'
  else
    @products = Product.all
    flash[:alert] = @order.errors.full_messages.join(", ")
    render :new_order, status: :unprocessable_entity
  end
end






def get_sizes
    product_id = params[:product_id]

    product_skus = ProductSku.where(product_id: product_id)
    sizes = product_skus.pluck(:size) 

    render json: sizes
  end

def exit
 
   
  if current_user&.user_detail&.role&.name == "Salesman"
  @order = Order.find(params[:id])
  visit = Visit.find_by(id: @order.visit_id)

  if visit
    visit.update!(leave_time: Time.current,order_status: "Placed Order")
  end

  redirect_to retailors_path, notice: 'Visit updated successfully.'
 end
end

def edit
  @order = Order.find(params[:id])
end

def update
    order = Order.find(params[:id]) 
    if order.update(status: params[:order][:status])
      redirect_to orders_path, notice: "Order status updated successfully."
    else
      redirect_to orders_path, alert: "Failed to update order status."
    end
  end
 def delivary_list
  @orders = Order.where(status: 2) 
end


private

  def order_params
    params.require(:order).permit( :visit_id,:user_id,:retailor_id,:status, :unique_code, :total_price, :advance_payment, :payment_status,:remaining_amount, :delivery_date, order_skus_attributes: [:product_id, :quantity, :price, :delivery_date,:size])
  end
  
end
