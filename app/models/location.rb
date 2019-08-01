class Location < ApplicationRecord

  has_and_belongs_to_many :restaurants
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  geocoded_by :city
  after_validation :geocode, :if => :city_changed?
end
