class AddOrderIdToOrderSkus < ActiveRecord::Migration[7.1]
  def change
    add_reference :order_skus, :order, foreign_key: true, type: :bigint
  end
end
