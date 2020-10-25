class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  has_many :steps, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :steps
end
