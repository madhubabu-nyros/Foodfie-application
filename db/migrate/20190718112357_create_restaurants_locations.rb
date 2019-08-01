class CreateRestaurantsLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants_locations do |t|
      t.references :restaurants, foreign_key: true
      t.references :locations, foreign_key: true

      t.timestamps
    end
  end
end
