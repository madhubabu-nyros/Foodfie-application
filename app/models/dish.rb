class Dish < ApplicationRecord
  belongs_to :category, optional: true	
  has_and_belongs_to_many :restaurants
  has_many :ratings, :dependent => :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  validates :name, presence: true
  validates :category_id, presence: true
end