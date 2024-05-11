class CreateMeezEnPlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :meez_en_places do |t|
      t.string :ingredient_name
      t.string :measurement

      t.timestamps
    end
  end
end
