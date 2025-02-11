class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.integer :number_of_products, null: false
      t.string :size
      t.integer :quantity, null: false
      t.date :delivery_date, null: false
      t.decimal :payment, precision: 10, scale: 2
      t.references :retailor, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
