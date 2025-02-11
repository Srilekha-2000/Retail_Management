class Order < ApplicationRecord
belongs_to :visit
belongs_to :user
has_many :order_skus
belongs_to :retailor 
accepts_nested_attributes_for :order_skus, allow_destroy: true
before_create :generate_unique_code
enum status: { pending: 0,packed: 4, shipped: 3,out_for_delivery: 1, delivered: 2 }
private

 def generate_unique_code
  current_time = Time.now.strftime("%Y%m%d%H%M%S")
  self.unique_code = "#{current_time}#{retailor_id}#{visit_id}"
end

end

