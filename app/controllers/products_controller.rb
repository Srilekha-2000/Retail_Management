class ProductsController < ApplicationController
before_action :authenticate_user!
  
def index
  search_term = params[:search]
  @products = Product.all
  @products = @products.where('name LIKE ?', "%#{search_term}%") if search_term.present?
  @products = @products.page(params[:page])
               .per(10)
end
  

def new
  @product = Product.new
  @product.product_skus.build
   @catagories = Catagory.all
end
def show
  @product = Product.find(params[:id])
end

 def create
  @product = Product.new(product_params)
  if @product.save!
    redirect_to @product, notice: 'Product was successfully created.'
  else
    render :new
  end
end

private

def product_params
    params.require(:product).permit(:name,:amount,:description,:catagory_id, product_skus_attributes: [:id, :quantity,:size, :price, :product_type,:_destroy])
  end
end
