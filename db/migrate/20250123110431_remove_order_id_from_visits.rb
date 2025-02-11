class RemoveOrderIdFromVisits < ActiveRecord::Migration[7.1]
 def change
    # Remove the foreign key constraint first
    remove_foreign_key :visits, :orders

    # Remove the order_id column
    remove_column :visits, :order_id
  end
end
