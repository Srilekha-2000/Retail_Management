class RetailorUser < ApplicationRecord
belongs_to :user
belongs_to :district
belongs_to :zone
belongs_to :retailor
 
end
