Category.delete_all
Product.delete_all
User.delete_all

User.create( username: "cjadmin", email: "cjlamkin64@gmail.com", password: "123", admin: true)
User.create( username: "cjuser", email: "cjlamkin64@yahoo.com", password: "123", admin: false)

5.times do
  category = Category.create( name: Faker::Commerce.department,
                            description: Faker::Lorem.sentence,
                            image_url: Faker::Avatar.image)
  (10..20).to_a.sample.times do
    category.products.create( product_name: Faker::Commerce.product_name,
                              product_description: Faker::Lorem.sentence,
                              price: Faker::Commerce.price,
                              image_url: Faker::Avatar.image,
                              quantity: rand(1..35))
  end
end
