Category.delete_all
Product.delete_all
User.delete_all

User.create( username: "cjadmin", email: "cjlamkin64@gmail.com", password: "123", admin: true)
User.create( username: "cjuser", email: "cjlamkin64@gmail.com", password: "123")

5.times do
  Category.create( name: Faker::Commerce.department,
                   description: Faker::Lorem.sentence,
                   image_url: Faker::Avatar.image)
end

15.times do
  Product.create( product_name: Faker::Commerce.product_name,
                  product_description: Faker::Lorem.sentence,
                  price: Faker::Commerce.price,
                  image_url: Faker::Avatar.image,
                  quantity: rand(1..20),
                  category_id: rand(1..5))
end
