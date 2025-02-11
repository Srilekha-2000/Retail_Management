class Visit < ApplicationRecord
#  belongs_to :retailor
  belongs_to :user
  belongs_to :zone,optional:true

  has_many :orders, dependent: :destroy

   has_many :retailor_visits
 
  #has_many :users, through: :retailor_visits
   has_many :retailors, through: :retailor_visits
   accepts_nested_attributes_for :retailor_visits, allow_destroy: true
   
 before_create :generate_visit_token

private

def generate_visit_token
  self.visit_token ||= generate_unique_token
end

def generate_unique_token
  Time.current.strftime('%Y%m%d%H%M%S%L') # YYYYMMDDHHMMSS + milliseconds
end
end