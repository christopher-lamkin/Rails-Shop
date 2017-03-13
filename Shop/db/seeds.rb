Category.delete_all
Product.delete_all
User.delete_all

User.create( username: "cjadmin", email: "cjlamkin64@gmail.com", password: "123", admin: true)
User.create( username: "cjuser", email: "cjlamkin64@yahoo.com", password: "123", admin: false)

category_one = Category.create( name: "Home Decor", description: "Products to decorate your abode", image_url: "http://www.homeownersjournal.com/wp-content/uploads/2015/08/modern-home-decor-342.jpg")
category_two = Category.create( name: "Sports", description: "Athletic gear, wear, and memorabilia", image_url: "http://www.proprofs.com/quiz-school/topic_images/p18lq7ediepl816p6s04171vo23.jpg")
category_three = Category.create( name: "Electronics", description: "Computers, accessories, drones, you name it", image_url: "http://www.gadgetreview.com/wp-content/uploads/2014/08/other-electronic-reviews.jpg")
category_four = Category.create( name: "Books", description: "All genres of books and eBooks", image_url: "http://www.startupremarkable.com/wp-content/uploads/2015/02/a-book-a-week-image.jpg")
category_five = Category.create( name: "Office", description: "From paper to paper weights", image_url: "http://sci-supplies.com/wp-content/uploads/2016/07/office-supplies.jpg")
category_six = Category.create( name: "Kitchen", description: "Cooking and cleaning supplies", image_url: "http://ak.c.ooyala.com/04dmdyNDE6mgcTfOELslxVRP0bCgPr43/promo292876389")
category_seven = Category.create( name: "Clothing", description: "Shirts, socks, skirts and more!", image_url: "http://www.gnldneolife.net/wp-content/uploads/2017/01/Clothing-Fabric-3.jpg")
category_eight = Category.create( name: "Toys", description: "All sorts of fun stuff", image_url: "https://evolvemedicalclinics.com/wp-content/uploads/2016/12/toys-21-for-post.jpg")

(10..20).to_a.sample.times do
  category_one.products.create( product_name: Faker::Commerce.product_name,
                            product_description: Faker::Lorem.sentence,
                            price: Faker::Commerce.price,
                            image_url: Faker::Avatar.image,
                            quantity: rand(1..35))
end

(10..20).to_a.sample.times do
  category_two.products.create( product_name: Faker::Commerce.product_name,
                            product_description: Faker::Lorem.sentence,
                            price: Faker::Commerce.price,
                            image_url: Faker::Avatar.image,
                            quantity: rand(1..35))
end

(10..20).to_a.sample.times do
  category_three.products.create( product_name: Faker::Commerce.product_name,
                            product_description: Faker::Lorem.sentence,
                            price: Faker::Commerce.price,
                            image_url: Faker::Avatar.image,
                            quantity: rand(1..35))
end

(10..20).to_a.sample.times do
  category_four.products.create( product_name: Faker::Commerce.product_name,
                            product_description: Faker::Lorem.sentence,
                            price: Faker::Commerce.price,
                            image_url: Faker::Avatar.image,
                            quantity: rand(1..35))
end

(10..20).to_a.sample.times do
  category_five.products.create( product_name: Faker::Commerce.product_name,
                            product_description: Faker::Lorem.sentence,
                            price: Faker::Commerce.price,
                            image_url: Faker::Avatar.image,
                            quantity: rand(1..35))
end

(10..20).to_a.sample.times do
  category_six.products.create( product_name: Faker::Commerce.product_name,
                            product_description: Faker::Lorem.sentence,
                            price: Faker::Commerce.price,
                            image_url: Faker::Avatar.image,
                            quantity: rand(1..35))
end

(10..20).to_a.sample.times do
  category_seven.products.create( product_name: Faker::Commerce.product_name,
                            product_description: Faker::Lorem.sentence,
                            price: Faker::Commerce.price,
                            image_url: Faker::Avatar.image,
                            quantity: rand(1..35))
end

(10..20).to_a.sample.times do
  category_eight.products.create( product_name: Faker::Commerce.product_name,
                            product_description: Faker::Lorem.sentence,
                            price: Faker::Commerce.price,
                            image_url: Faker::Avatar.image,
                            quantity: rand(1..35))
end
