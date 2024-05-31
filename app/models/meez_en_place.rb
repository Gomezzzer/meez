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
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class MeezEnPlace < ApplicationRecord
  # Associations
  belongs_to :user


  # Validations
  validates :ingredient_name, presence: true
  validates :measurement, presence: true
end
