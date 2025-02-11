class RemoveDistrictToRetailors < ActiveRecord::Migration[7.1]
  def change
    remove_column :retailors, :district, :bigint
  end
end
