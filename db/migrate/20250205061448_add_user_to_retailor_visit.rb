class AddUserToRetailorVisit < ActiveRecord::Migration[7.1]
   def change
    add_reference :retailor_visits, :user, foreign_key: true
   add_column :retailor_visits, :visiting_time, :datetime
   add_reference :retailor_visits, :district, null: true, foreign_key: true
    add_reference :retailor_visits, :zone, null: true, foreign_key: true
  end
end
