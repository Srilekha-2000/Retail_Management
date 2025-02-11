class ChangeHasOrderDefaultInVisits < ActiveRecord::Migration[7.1]
  def change
    change_column_default :visits, :has_order, from: false, to: nil
  end
end
