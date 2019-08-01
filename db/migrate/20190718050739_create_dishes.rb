class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.float :price
      t.string :category_id
      t.string :integer

      t.timestamps
    end
  end
end
