# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

users = [
    {
        email: "test@test.com",
        password: "test-account"
    },
    {
        email: "iloveplants@plants.com",
        password: "plant-luv"
    },
    {
        email: "info@plantposse.com",
        password: "plant-p0sse"
    }
]

# users.each do |email, password| 
#     User.create(email: email, password: password)
# end

User.create(users)