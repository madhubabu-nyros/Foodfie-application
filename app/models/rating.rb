class Rating < ApplicationRecord
	belongs_to :dish
	validates :number, presence: true
end
