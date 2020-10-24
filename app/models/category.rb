class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :recipes
  has_many :recipe_categories
end
