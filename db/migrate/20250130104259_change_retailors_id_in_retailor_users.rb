class ChangeRetailorsIdInRetailorUsers < ActiveRecord::Migration[7.1]
   def change
    remove_column :retailor_users, :retailors_id, :integer, array: true, default: []
    add_reference :retailor_users, :retailor, null: true, foreign_key: true
     add_column :retailor_users, :task_ids, :integer, array: true, default: []
  end
end
