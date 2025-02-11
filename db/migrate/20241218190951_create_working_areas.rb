class CreateWorkingAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :working_areas do |t|
      t.string :retailer_name
      t.string :district
      t.string :address
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
