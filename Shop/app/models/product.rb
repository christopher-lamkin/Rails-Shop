class Product < ApplicationRecord
  validates_presence_of :product_name, :product_description, :product_price
end
