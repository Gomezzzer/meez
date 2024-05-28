class AddAllergiesToRecipeModifiers < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_modifiers, :allergies, :string
  end
end
