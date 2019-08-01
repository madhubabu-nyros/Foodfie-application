class ChangeNameTable < ActiveRecord::Migration[5.2]
  def change
  	rename_table :dishes_restaurants, :restaurants_dishes
  end
end
