class Zone < ApplicationRecord
belongs_to :district
has_many :user_details
has_many :retailors
has_and_belongs_to_many :users
has_many :visits
has_many :retailor_users
end
