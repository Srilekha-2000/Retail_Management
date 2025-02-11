class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.datetime :date_of_time, null: false
      t.string :order_status
      t.datetime :leave_time
      t.references :user, null: false, foreign_key: true         # Salesman (User)
      t.references :role, null: false, foreign_key: true         # Salesman role (foreign key to roles table)
      t.string :address                                           # Visit address
      t.boolean :has_order, default: false                       # Whether an order was placed
      t.references :retailor, null: false, foreign_key: true      # Retailer visited
      t.references :order, foreign_key: true                     # Associated order (if any)

      t.timestamps
    end
  end
end
