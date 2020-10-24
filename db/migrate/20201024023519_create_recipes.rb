class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.boolean :favorite, default: false

      t.timestamps
    end
  end
end
