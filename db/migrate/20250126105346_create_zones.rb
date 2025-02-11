class CreateZones < ActiveRecord::Migration[7.1]
  def change
    create_table :zones do |t|
      t.string :name
      t.string :unique_code
      t.references :district, null: false, foreign_key: true

      t.timestamps
    end
  end
end
