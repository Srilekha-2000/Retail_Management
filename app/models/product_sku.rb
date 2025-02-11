class ProductSku < ApplicationRecord
belongs_to :product
has_many :order_skus
end
