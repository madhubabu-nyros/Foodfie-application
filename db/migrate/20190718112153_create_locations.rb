class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :street
      t.string :string
      t.string :city
      t.string :string
      t.string :state
      t.string :string
      t.string :pincode
      t.string :integer
      t.string :country
      t.string :string

      t.timestamps
    end
  end
end
