class AddUserIdToMeezEnPlaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :meez_en_places, :user, foreign_key: true
  end
end
