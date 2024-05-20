class AddImageToRecipeModifiers < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_modifiers, :image, :string
  end
end
