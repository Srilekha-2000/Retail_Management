class UpdateOrderSkusTable < ActiveRecord::Migration[7.1]
 
    def change
   
    remove_column :order_skus, :quantities, :integer, array: true, default: []
    remove_column :order_skus, :prices, :decimal, array: true, default: []
    remove_column :order_skus, :delivery_dates, :date, array: true, default: []
    remove_column :order_skus, :product_ids, :bigint, array: true, default: []

  
  
    add_reference :order_skus, :product, foreign_key: true
    add_column :order_skus, :quantity, :integer
    add_column :order_skus, :price, :decimal
    add_column :order_skus, :delivery_date, :date
 
  end
end
