# == Schema Information
#
# Table name: meez_en_places
#
#  id              :integer          not null, primary key
#  ingredient_name :string
#  measurement     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
# Indexes
#
#  index_meez_en_places_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class MeezEnPlace < ApplicationRecord
  # Validations
  validates :ingredient_name, presence: true
  validates :measurement, presence: true
  
  

  # Associations
  # You can add associations here if needed, for example:
   belongs_to :user
end
