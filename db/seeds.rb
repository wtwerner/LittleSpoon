Category.destroy_all

Category.create!([
    {name: "Breakfast"},
    {name: "Lunch"},
    {name: "Dinner"},
    {name: "Dessert"},
    {name: "Snack"},
    {name: "Side"},
    {name: "Drink"},
    {name: "Chicken"},
    {name: "Beef"},
    {name: "Pork"},
    {name: "Vegetable"},
    {name: "Soup"},
    {name: "Bread"},
    {name: "Salad"},
    {name: "Stew"},
    {name: "Fruit"},
    {name: "Pasta"},
    {name: "Grilling"},
    {name: "Seafood"},
    {name: "Healthy"},
    {name: "World Cuisine"}
])

50.times do
    user=User.new(
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
    user.save!
end

users = User.order(:created_at).take(6)
20.times do
    name = Faker::Food.dish
    description = Faker::Food.description
    users.each { |user| user.recipes.create!(name: name, public: true, description: description) }
end