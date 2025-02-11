class AddAmountToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :amount, :bigint
  end
end
