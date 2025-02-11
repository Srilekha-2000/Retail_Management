class CreateRetailorUsers < ActiveRecord::Migration[7.1]
   def change
    create_table :retailor_users do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :retailors_id, array: true, default: []  # Array type for PostgreSQL

      t.timestamps
    end
  end
end
