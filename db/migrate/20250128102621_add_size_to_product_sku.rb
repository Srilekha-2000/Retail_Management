class AddSizeToProductSku < ActiveRecord::Migration[7.1]
  def change
    add_column :product_skus, :size, :string
    add_column :order_skus, :size, :string
    add_column :product_skus, :mop, :bigint
    remove_column :orders, :name, :string
    add_column :orders, :remaining_amount, :bigint

  end
end
