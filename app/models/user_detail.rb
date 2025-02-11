class UserDetail < ApplicationRecord
belongs_to :role
belongs_to :user
belongs_to :district
belongs_to :zone, optional: true
 
end
