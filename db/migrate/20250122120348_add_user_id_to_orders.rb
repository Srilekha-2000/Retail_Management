class AddUserIdToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :user, foreign_key: true, null: false
  end
end
