class CreateRetailors < ActiveRecord::Migration[7.1]
  def change
    create_table :retailors do |t|
      t.string :shop_name
      t.string :owner_name
      t.text :address
      t.string :district
      t.references :user, null: false, foreign_key: true
      t.string :mobile_number
      t.integer :pin

      t.timestamps
    end
  end
end
