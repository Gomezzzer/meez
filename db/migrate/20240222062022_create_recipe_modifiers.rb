class CreateRecipeModifiers < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_modifiers do |t|
      t.string :name
      t.text :description
      t.string :recipe
      t.string :measurements

      t.timestamps
    end
  end
end
