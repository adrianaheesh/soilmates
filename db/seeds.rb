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
    }
]
    # ,
    # {
    #     name: ,
    #     price: ,
    #     description: ,
    #     availability: ,
    #     store: 2,
    #     category: ,
    #     light: ,
    #     difficulty: 
    # },
    # {
    #     name: ,
    #     price: ,
    #     description: ,
    #     availability: ,
    #     store: 2,
    #     category: ,
    #     light: ,
    #     difficulty: 
    # },
    # {
    #     name: ,
    #     price: ,
    #     description: ,
    #     availability: ,
    #     store: 1,
    #     category: ,
    #     light: ,
    #     difficulty: 
    # },
    # {
    #     name: ,
    #     price: ,
    #     description: ,
    #     availability: ,
    #     store: 1,
    #     category: ,
    #     light: ,
    #     difficulty: 
    # },
    # {
    #     name: ,
    #     price: ,
    #     description: ,
    #     availability: ,
    #     store: 1,
    #     category: ,
    #     light: ,
    #     difficulty: 
    # }


Product.create(products)