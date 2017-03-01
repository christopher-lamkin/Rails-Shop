Product.delete_all

15.times do
  Product.create( product_name: Faker::Commerce.product_name,
                  product_description: Faker::RickAndMorty.quote,
                  price: Faker::Commerce.price,
                  image_url: Faker::Avatar.image)
end
