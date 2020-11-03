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

50.times do
    name = Faker::Food.unique.dish
    user = User.all.sample
    description = Faker::Food.description
    user.recipes.create!(name: name, public: true, description: description)
end

cat_ids = Category.all.ids
rec_ids = Recipe.all.ids

rec_ids.each do |id|
    RecipeCategory.create(recipe_id: id, category_id: cat_ids.sample)
end