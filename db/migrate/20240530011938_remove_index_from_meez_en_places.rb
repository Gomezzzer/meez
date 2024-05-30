class RemoveIndexFromMeezEnPlaces < ActiveRecord::Migration[7.0]
  def change
    remove_index :meez_en_places, name: "index_meez_en_places_on_user_id"
  end
end
