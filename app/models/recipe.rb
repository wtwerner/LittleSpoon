class Recipe < ApplicationRecord
  has_many :ingredient_recipes
  has_many :category_recipes
  has_many :ingredients, through: :ingredient_recipes
  has_many :categories, through: :category_recipes
  has_many :steps

  accepts_nested_attributes_for :ingredients
end
