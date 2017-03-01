class Product < ApplicationRecord
  validates_presence_of :product_name, :product_description, :price
end
