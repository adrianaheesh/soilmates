# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Store.destroy_all
Product.destroy_all

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

User.create(users)

stores = [
    {
        name: "I Love Plants",
        description: "I love plants was created in 2020 with one goal: to bring life into your living space!",
        user_id: User.find_by_email("iloveplants@plants.com").id
    },
    {
        name: "Plant Posse",
        description: "Your one-stop-shop for all things indoor plants.",
        user_id: User.find_by_email("info@plantposse.com").id
    }
]

Store.create(stores)

products = [
    {
        name: "Mini cactus",
        price: 15.00,
        description: "The perfect desk companion due to its small size - watch out for the prickles though!",
        availability: true,
        store_id: Store.find_by_name("I Love Plants").id,
        category: "Plant",
        light: "Bright",
        difficulty: "Plant Beginner"
    },
    {
        name: "Anthurium",
        price: 30.00,
        description: "Super durable with minimal care required, this gorg Anthurium is bound to brighten up your space.",
        availability: true,
        store_id: Store.find_by_name("I Love Plants").id,
        category: "Plant",
        light: "Bright",
        difficulty: "Plant Beginner"
    },
    {
        name: "Copper Watering Can",
        price: 24.99,
        description: "1L capacity. Easily water indoor plants with the long spout that guides water flow exactly where you need it to go without spilling.",
        availability: false,
        store_id: Store.find_by_name("I Love Plants").id,
        category: "Pot"
    },
    {
        name: "Ivy",
        price: 25.00,
        description: "This climbing vine works perfectly amongst a book shelf, or cascading down the wall.",
        availability: true,
        store_id: Store.find_by_name("Plant Posse").id,
        category: "Plant",
        light: "Bright",
        difficulty: "Have kept a few plants alive"
    },
    {
        name: "Fiddle Leaf Fig",
        price: 40.00,
        description: "Perhaps the trendiest plant of all time, the fiddle leaf is a staple in a medium lit room and if properly cared for, can grow to touch the ceiling!",
        availability: true,
        store_id: Store.find_by_name("Plant Posse").id,
        category: "Plant",
        light: "Medium",
        difficulty: "Have kept a few plants alive"
    },
    {
        name: "Monstera Deliciozo",
        price: 45.00,
        description: "Otherwise known as the Swisse Cheese plant, this beauty is suitable for beginners and makes a statement in any room.",
        availability: true,
        store_id: Store.find_by_name("Plant Posse").id,
        category: "Plant",
        light: "Low",
        difficulty: "Plant Beginner"
    }
]

Product.create(products)