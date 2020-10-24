class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :ingredient_recipes
  has_many :recipes, through: :ingredient_recipes
end
