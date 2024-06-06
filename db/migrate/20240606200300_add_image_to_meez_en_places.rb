class AddImageToMeezEnPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :meez_en_places, :image, :string
  end
end
