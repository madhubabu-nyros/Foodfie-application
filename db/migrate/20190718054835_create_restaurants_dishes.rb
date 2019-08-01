class CreateRestaurantsDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants_dishes do |t|
      t.references :restaurants, foreign_key: true
      t.references :dishes, foreign_key: true
      t.timestamps
    end
  end
end
