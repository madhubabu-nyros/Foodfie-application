class Rating < ApplicationRecord
	belongs_to :dish
	validates_presence_of :number, message: '*Enter Rating'
end
