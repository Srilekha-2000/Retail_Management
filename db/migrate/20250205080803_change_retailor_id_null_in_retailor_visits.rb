class ChangeRetailorIdNullInRetailorVisits < ActiveRecord::Migration[7.1]
 def change
    change_column_null :retailor_visits, :retailor_id, true 
    remove_column :retailor_visits, :district_id, :integer
    remove_column :retailor_visits, :zone_id, :integer
     remove_column :visits, :role_id, :integer
  end
end
