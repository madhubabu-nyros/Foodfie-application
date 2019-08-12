class Location < ApplicationRecord
  has_and_belongs_to_many :restaurants
  validates_presence_of :street, message: '*Enter street'
  validates_presence_of :city, message: '*Enter city'
  validates_presence_of :state, message: '*Enter state'
  validates_presence_of :country, message: '*Enter country'
  validates_presence_of :pincode, message: '*Enter pincode'
  geocoded_by :city
  after_validation :geocode, :if => :city_changed?
end
