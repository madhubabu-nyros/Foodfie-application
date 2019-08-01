class Picture < ApplicationRecord
	belongs_to :imageable, polymorphic: true 
	mount_uploader :name, ImageUploader 
  validates_presence_of :name
end
