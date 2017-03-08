class Category < ApplicationRecord
  validates_presence_of :name
  has_many :categories_products
  has_many :products, through: :categories_products
end
