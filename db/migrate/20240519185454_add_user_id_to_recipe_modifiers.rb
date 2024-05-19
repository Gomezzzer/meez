class AddUserIdToRecipeModifiers < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_modifiers, :user_id, :integer
  end
end
