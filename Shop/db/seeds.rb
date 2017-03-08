Product.delete_all
User.delete_all

User.create( username: "cjadmin", email: "cjlamkin64@gmail.com", password: "123", admin: true)
User.create( username: "cjuser", email: "cjlamkin64@gmail.com", password: "123")

15.times do
  Product.create( product_name: Faker::Commerce.product_name,
                  product_description: Faker::Lorem.sentence,
                  price: Faker::Commerce.price,
                  image_url: Faker::Avatar.image,
                  quantity: rand(1..20))
end
