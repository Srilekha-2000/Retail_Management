class AddReasonToVisits < ActiveRecord::Migration[7.1]
  def change
    add_column :visits, :reason, :string
  end
end
