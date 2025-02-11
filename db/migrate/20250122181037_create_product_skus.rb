class CreateProductSkus < ActiveRecord::Migration[7.1]
  def change
    create_table :product_skus do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.string :product_type

      t.timestamps
    end
  end
end
