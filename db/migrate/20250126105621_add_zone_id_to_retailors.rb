class AddZoneIdToRetailors < ActiveRecord::Migration[7.1]
  def change
    add_reference :retailors, :zone, foreign_key: true
  end
end
