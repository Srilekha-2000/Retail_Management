class CreateUserDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :user_details do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.bigint :state_id
      t.bigint :district_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :gender
      t.date :date_of_birth
      t.integer :proof_of_id
      t.string :id_proof_details
      t.string :building_name
      t.string :flat_no
      t.string :road
      t.string :block_sector
      t.string :post_office
      t.string :state
      t.string :village_or_city

      t.timestamps
    end
  end
end
