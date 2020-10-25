class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates_presence_of :name
  validates_presence_of :quantity
  validates_presence_of :unit
end
