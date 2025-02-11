class Retailor < ApplicationRecord
  belongs_to :user
  belongs_to :zone, optional: true
  has_many :orders
  # has_many :visits, dependent: :destroy
  # has_many :retailor_visits
  # has_many :visits, :through => :retailor_visits  
   belongs_to :district
 
  has_many :retailor_visits
  has_many :visits, through: :retailor_visits
end
