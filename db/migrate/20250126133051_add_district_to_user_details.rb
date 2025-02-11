class AddDistrictToUserDetails < ActiveRecord::Migration[7.1]
   def change
    add_reference :user_details, :district, foreign_key: true, type: :bigint
  end
end
