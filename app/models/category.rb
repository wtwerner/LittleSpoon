class Category < ApplicationRecord
  belongs_to :user
  has_many :category_recipes
  has_many :recipes, through: :category_recipes
end
