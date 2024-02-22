class DropRecipeModifiersTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :recipe_modifiers
  end

end
