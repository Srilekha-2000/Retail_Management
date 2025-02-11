# app/controllers/categories_controller.rb
class CatagoriesController < ApplicationController
  # Display all categories
  def index
    @catagories = Catagory.all
  end

  def new
    @catagory = Catagory.new
  end

  def create
    @catagory = Catagory.new(catagory_params)
    
    if @catagory.save!
      redirect_to catagories_path, notice: 'Catagory was successfully created.'
    else
      render :new
    end
  end

  private

  def catagory_params
    params.require(:catagory).permit(:name)
  end
end
