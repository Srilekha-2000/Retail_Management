class CreateJoinTableUserZone < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :zones do |t|
      t.index :user_id
      t.index :zone_id
    end
  end
end
