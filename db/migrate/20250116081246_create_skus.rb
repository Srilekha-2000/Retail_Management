class CreateSkus < ActiveRecord::Migration[7.1]
  def change
    create_table :skus do |t|
      t.references :product, null: false, foreign_key: true # Ensuring product_id is a foreign key
      t.references :order, null: false, foreign_key: true   # Ensuring order_id is a foreign key
      t.string :product_size
      t.integer :quantity
      t.date :delivery_date
      t.string :payment

      t.timestamps
    end
  end
end




     
