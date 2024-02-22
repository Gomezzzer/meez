# == Schema Information
#
# Table name: recipe_modifiers
#
#  id           :integer          not null, primary key
#  description  :text
#  measurements :string
#  name         :string
#  recipe       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class RecipeModifier < ApplicationRecord
   # Validations
   validates :name, presence: true
   validates :description, presence: true
   validates :recipe, presence: true
   validates :measurements, presence: true
 
   # Associations
   # If your RecipeModifier model needs to associate with other models,
   # you can define the associations here.
end
