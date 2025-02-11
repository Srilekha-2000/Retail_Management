class CreateOrderSkus < ActiveRecord::Migration[7.1]
  def change
    create_table :order_skus do |t|
     
      t.integer :quantity
      t.decimal :price
      t.date :delivery_date
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
