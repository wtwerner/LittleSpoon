class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit
      t.integer :quantity
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :recipes, null: false, foreign_key: true

      t.timestamps
    end
  end
end
