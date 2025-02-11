class AddCatagoryToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :catagory, foreign_key: true
  end
end
