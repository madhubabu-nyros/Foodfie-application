class DishesRestaurant < ApplicationRecord
  belongs_to :restaurants
  belongs_to :dishes
end