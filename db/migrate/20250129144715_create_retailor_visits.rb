class CreateRetailorVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :retailor_visits do |t|
      t.references :visit, null:false,foreign_key: true
      t.references :retailor, null: false, foreign_key: true
      t.string :status
      t.string :activity

      t.timestamps
    end
  end
end
