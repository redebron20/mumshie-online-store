# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#   categories = Category.create([{ name: 'Groceries' }, { name: 'Clothing' }, { name: 'Accessories' }])
#   Product.create(name: 'Banana', category: categories.first)


Category.destroy_all
Product.destroy_all

20.times do
    p = Product.create(
        name: Faker::Commerce.product_name,
        price: Faker::Commerce.price,
        description: Faker::Hipster.sentence(word_count: rand(4..8)),
        category: (Category.create(
            name: Faker::Commerce.department,
            description: Faker::Lorem.words
        ))
    )
    puts "Creating #{p.name}"
end
