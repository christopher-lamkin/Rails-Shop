class Product < ApplicationRecord
  validates_presence_of :product_name, :product_description, :price, :quantity
  belongs_to :category
end
