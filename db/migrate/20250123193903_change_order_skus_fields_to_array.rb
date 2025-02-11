class ChangeOrderSkusFieldsToArray < ActiveRecord::Migration[7.1]
  def change
    change_table :order_skus do |t|
      t.remove :quantity, :price, :delivery_date, :product_id
      t.column :quantities, :integer, array: true, default: []
      t.column :prices, :numeric, array: true, default: []
      t.column :delivery_dates, :date, array: true, default: []
      t.column :product_ids, :bigint, array: true, default: []
    end
  end
end
