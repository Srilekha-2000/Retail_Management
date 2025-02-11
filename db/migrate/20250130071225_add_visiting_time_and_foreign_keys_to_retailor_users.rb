class AddVisitingTimeAndForeignKeysToRetailorUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :retailor_users, :visiting_time, :datetime
    add_reference :retailor_users, :district, null: true, foreign_key: true
    add_reference :retailor_users, :zone, null: true, foreign_key: true
  end
end
