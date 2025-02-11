class AddVisitIdToVisits < ActiveRecord::Migration[7.1]
  def change
    add_column :visits, :visit_id, :bigint
    add_reference :visits, :zone, null: true, foreign_key: true
  end
end
