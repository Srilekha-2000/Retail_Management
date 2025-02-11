class Role < ApplicationRecord
has_and_belongs_to_many :users
has_many :user_details
  has_many :users, through: :roles_users
  has_many :user_details, dependent: :destroy
end
