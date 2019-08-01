class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
  	rename_table :restaurants_dishes, :dishes_restaurants
  end
end
