class ModifyOrdersTable < ActiveRecord::Migration[7.0]
  def change
    change_table :orders do |t|
      # Add new columns
      t.string :unique_code, null: false
      t.decimal :total_price, precision: 10, scale: 2, null: false
      t.decimal :advance_payment, precision: 10, scale: 2, null: false
      t.string :payment_status, null: false
      t.date :delivery_date
    end

    # Add unique index for unique_code
    add_index :orders, :unique_code, unique: true
  end
end
