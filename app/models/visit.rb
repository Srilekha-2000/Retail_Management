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
    timestamp_part = Time.current.strftime('%H%M%S')[-4..] 
    zone_part = zone_id.to_s.rjust(2, '0') 

    loop do
      token = "#{zone_part}#{timestamp_part}".to_i 
      break token unless Visit.exists?(visit_token: token)
    end
  end
end