class AddZoneIdToUserDetails < ActiveRecord::Migration[7.1]
  def change
    add_column :user_details, :zone_id, :integer
    add_foreign_key :user_details, :zones, column: :zone_id
   
  end
end
