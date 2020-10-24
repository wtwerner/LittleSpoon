class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :ingredients_recipes
  has_many :recipes, through: :ingredients_recipes
end
