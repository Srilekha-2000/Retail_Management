class RenameVisitIdToVisitToken < ActiveRecord::Migration[7.1]
 def change
    rename_column :visits, :visit_id, :visit_token
  
  end
end
