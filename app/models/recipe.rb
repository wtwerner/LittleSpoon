class Recipe < ApplicationRecord
  has_many :ingredients_recipes
  has_many :categories_recipes
  has_many :ingredients, through: :ingredients_recipes
  has_many :categories, through: :categories_recipes
  has_many :steps
end
