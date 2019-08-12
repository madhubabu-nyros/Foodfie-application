class Restaurant < ApplicationRecord
  has_many :pictures, as: :imageable, dependent: :destroy
  has_and_belongs_to_many :dishes, dependent: :destroy
  has_and_belongs_to_many :locations, dependent: :destroy
  accepts_nested_attributes_for :pictures
  validates_presence_of :pictures
  validates_presence_of :name, message: '*Enter Restaurant name'
  validates :name, :uniqueness => { :case_sensitive => false}
end
