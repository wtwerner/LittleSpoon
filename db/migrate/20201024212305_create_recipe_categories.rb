class CreateRecipeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_categories do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :recipe, null: false, foreign_key: true
    end
  end
end
