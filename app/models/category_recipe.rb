class CategoryRecipe ActiveRecord::Base
    belongs_to :category
    belongs_to :recipe
end