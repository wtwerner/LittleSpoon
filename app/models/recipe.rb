class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  has_many :steps, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true

  scope :published, -> { where(public: true) }
  scope :alphabetized, -> { order("name ASC") }

  def self.search(search)
    where("name LIKE ?", "%#{search}%") 
  end
end
