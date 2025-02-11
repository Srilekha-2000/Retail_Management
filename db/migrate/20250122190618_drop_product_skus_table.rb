class DropProductSkusTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :productskus, if_exists: true
  end

  def down
    
    create_table :productskus do |t|

      t.timestamps
    end
  end
end
