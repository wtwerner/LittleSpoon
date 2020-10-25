class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  has_many :steps
  has_many :ingredients
  has_many :comments

  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :steps
end
