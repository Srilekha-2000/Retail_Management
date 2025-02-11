class AddVisitIdToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :visit, foreign_key: true
  end
end
