class RemoveDistrictIdFromUserDetails < ActiveRecord::Migration[7.1]
   def change
    remove_column :user_details, :district_id, :bigint
  end
end
