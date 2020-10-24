class Recipe < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :ingredients
  has_many :steps
end
