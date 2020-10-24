class Category < ApplicationRecord
  belongs_to :user
  has_many :categories_recipes
  has_many :recipes, through: :categories_recipes
end
