class CreateCatagories < ActiveRecord::Migration[7.1]
  def change
    create_table :catagories do |t|
    t.string :name

      t.timestamps
    end
  end
end
