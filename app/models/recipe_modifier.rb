# == Schema Information
#
# Table name: recipe_modifiers
#
#  id           :integer          not null, primary key
#  allergies    :string
#  description  :text
#  image        :string
#  measurements :string
#  name         :string
#  recipe       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
class RecipeModifier < ApplicationRecord
   # Associations
   belongs_to :user
 
   # Constants
   ALLERGIES = %w(peanut dairy gluten lobster vegan vegetarian) # Add all valid allergies here
 
   # Validations
   validates :user, presence: true
   validates :name, presence: true
   validates :description, presence: true
   validates :recipe, presence: true
   validates :measurements, presence: true
   validate :allergies_must_be_valid
 
   # Uploaders
   mount_uploader :image, ImageUploader
 
   # Instance Methods
   def allergies_list
     allergies.present? ? allergies.split(",") : []
   end
 
   private
 
   def allergies_must_be_valid
     if allergies.present?
       allergies_list.each do |allergy|
         errors.add(:allergies, "#{allergy} is not a valid allergy") unless ALLERGIES.include?(allergy)
       end
     end
   end

   

  def self.ransackable_attributes(auth_object = nil)
    %w[name description ingredients measurements]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end

 end
 
