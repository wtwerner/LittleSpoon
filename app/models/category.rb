class Category < ApplicationRecord
  belongs_to :user
  has_many :recipe_categories
end
