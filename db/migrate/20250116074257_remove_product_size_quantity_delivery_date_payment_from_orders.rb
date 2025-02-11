class RemoveProductSizeQuantityDeliveryDatePaymentFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :size, :string
    remove_column :orders, :quantity, :integer
    remove_column :orders, :delivery_date, :date
    remove_column :orders, :payment, :string
    remove_column :orders, :number_of_products, :integer
  end
end
