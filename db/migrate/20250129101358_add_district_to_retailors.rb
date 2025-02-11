class AddDistrictToRetailors < ActiveRecord::Migration[7.1]
  def change
    add_reference :retailors, :district, null: true, foreign_key: true
  end
end
