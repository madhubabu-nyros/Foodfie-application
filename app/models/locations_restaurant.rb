class LocationsRestaurant < ApplicationRecord
  belongs_to :restaurants
  belongs_to :locations
end
