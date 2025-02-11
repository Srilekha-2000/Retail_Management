class AddRetailorToVisits < ActiveRecord::Migration[7.1]
  def change
     add_reference :visits, :retailor, null: true, foreign_key: true
  end
end
