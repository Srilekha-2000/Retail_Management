class District < ApplicationRecord
has_many :zones
has_many :user_details
has_many :retailors
has_many :retailor_users
end
