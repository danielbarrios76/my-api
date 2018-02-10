# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create users
Faker::Number.between(5, 10).times do
    User.create name: Faker::Name.first_name,     
                email: Faker::Internet.email,     
                credits: Faker::Number.decimal(3) 
end

# create some items
Faker::Number.between(10, 15).times do
    Item.create state: "in_process",
                name: Faker::Commerce.product_name,     
                description: Faker::Lorem.sentence,     
                initial_bid: Faker::Number.decimal(3),  
                user: User.order("RANDOM()").first,     
                finish_at: Faker::Time.between(DateTime.now, 5.days.from_now)
end