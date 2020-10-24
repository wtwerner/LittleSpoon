class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_categories
  has_many :ingredients
  has_many :steps
end
