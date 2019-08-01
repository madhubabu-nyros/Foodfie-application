class Restaurant < ApplicationRecord
  has_many :pictures, as: :imageable, dependent: :destroy
  has_and_belongs_to_many :dishes, dependent: :destroy
  has_and_belongs_to_many :locations, dependent: :destroy
  accepts_nested_attributes_for :pictures
  validates :name, presence: true
  validates :name, :uniqueness => { :case_sensitive => false}
end
