class Recipe < ApplicationRecord
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :categories
  has_many :steps
end
