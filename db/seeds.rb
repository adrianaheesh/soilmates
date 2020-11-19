User.destroy_all
Store.destroy_all
Product.destroy_all

users = [
    {
        email: "test@test.com",
        password: "test-account"
    },
    {
        email: "plantparenthood@plants.com",
        password: "plant-luv"
    },
    {
        email: "info@plantposse.com",
        password: "plant-p0sse"
    }
]

User.create(users)

# creating stores
store_1 = Store.new(
            name: "Plant Parenthood", 
            description: "We have one goal: to bring life into your living space!", 
            user_id: User.find_by_email("plantparenthood@plants.com").id)

store_1.banner.attach(
            io: File.open(Rails.root.join('app/assets/images/plant-parenthood.png')), 
            filename: 'plant-parenthood.png', 
            content_type: 'image/png')
store_1.save!
                    
store_2 = Store.new(
            name: "Plant Posse", 
            description: "Your one-stop-shop for all things indoor plants.", 
            user_id: User.find_by_email("info@plantposse.com").id)

store_2.banner.attach(
            io: File.open(Rails.root.join('app/assets/images/plant-posse-banner.png')), 
            filename: 'plant-posse-banner.png', 
            content_type: 'image/png')
store_2.save!
                    
# creating products
product = Product.new(
            name: "Mini cactus",
            price: 15.00,
            description: "The perfect desk companion due to its small size - watch out for the prickles though!",
            availability: true,
            store_id: Store.find_by_name("Plant Parenthood").id,
            category: "Plant",
            light: "Bright",
            difficulty: "Plant beginner"
            )
product.image.attach(
            io: File.open(Rails.root.join('app/assets/images/8.png')),
            filename: '8.png',
            content_type: 'image/png'
        )
product.save!
        
product2 = Product.new(
            name: "Anthurium",
            price: 30.00,
            description: "Super durable with minimal care required, this gorg Anthurium is bound to brighten up your space.",
            availability: true,
            store_id: Store.find_by_name("Plant Parenthood").id,
            category: "Plant",
            light: "Bright",
            difficulty: "Plant beginner"
        )
product2.image.attach(
            io: File.open(Rails.root.join('app/assets/images/3.png')),
            filename: '3.png',
            content_type: 'image/png'
            )
product2.save!

product3 = Product.new(
            name: "Copper Watering Can",
            price: 24.99,
            description: "1L capacity. Easily water indoor plants with the long spout that guides water flow exactly where you need it to go without spilling.",
            availability: true,
            store_id: Store.find_by_name("Plant Parenthood").id,
            category: "Pot"   
            )
product3.image.attach(
            io: File.open(Rails.root.join('app/assets/images/7.png')),
            filename: '7.png',
            content_type: 'image/png'
            )
product3.save!
  
product4 = Product.new(
            name: "Ivy",
            price: 25.00,
            description: "This climbing vine works perfectly amongst a book shelf, or cascading down the wall.",
            availability: true,
            store_id: Store.find_by_name("Plant Posse").id,
            category: "Plant",
            light: "Bright",
            difficulty: "Mildly smug"
            )
product4.image.attach(
            io: File.open(Rails.root.join('app/assets/images/4.png')),
            filename: '4.png',
            content_type: 'image/png'
            )
product4.save!

product5 = Product.new(
            name: "Fiddle Leaf Fig",
            price: 40.00,
            description: "Perhaps the trendiest plant of all time, the fiddle leaf is a staple in a medium lit room and if properly cared for, can grow to touch the ceiling!",
            availability: true,
            store_id: Store.find_by_name("Plant Posse").id,
            category: "Plant",
            light: "Medium",
            difficulty: "Mildly smug"
            )
product5.image.attach(
            io: File.open(Rails.root.join('app/assets/images/5.png')),
            filename: '5.png',
            content_type: 'image/png'
            )
product5.save!

product6 = Product.new(
            name: "Monstera Deliciozo",
            price: 45.00,
            description: "Otherwise known as the Swisse Cheese plant, this beauty is suitable for beginners and makes a statement in any room.",
            availability: true,
            store_id: Store.find_by_name("Plant Posse").id,
            category: "Plant",
            light: "Low",
            difficulty: "Plant beginner"
            )
product6.image.attach(
            io: File.open(Rails.root.join('app/assets/images/6.png')),
            filename: '6.png',
            content_type: 'image/png'
)
product6.save!

