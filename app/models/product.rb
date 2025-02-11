class Product < ApplicationRecord
has_many :order_skus
has_many :products
has_many :orders, through: :order_skus
has_many :product_skus, dependent: :destroy
accepts_nested_attributes_for :product_skus, allow_destroy: true
belongs_to :catagory
end
