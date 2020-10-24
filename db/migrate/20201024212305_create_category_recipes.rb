class CreateCategoryRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :category_recipes do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :recipe, null: false, foreign_key: true
    end
  end
end
