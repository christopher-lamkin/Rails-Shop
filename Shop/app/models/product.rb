class Product < ApplicationRecord
  validates_presence_of :product_name, :product_description, :price, :quantity
  has_many :categories_products
  has_many :categories, through: :categories_products
  has_many :carts_products
  has_many :carts, through: :carts_products
end
