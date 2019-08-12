require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  	it 'ensures name presence' do
      restaurant = Restaurant.new(name: '').save
      expect(restaurant).to eq(true)
    end

    it 'should save successfully' do 
      restaurant = Restaurant.new(name: 'kokila').save
      expect(restaurant).to eq(true)
    end

    it "validates uniqueness of name" do
	    restaurant = Restaurant.new(name: 'Yati').save
	    should validate_uniqueness_of(:name).case_insensitive	
	  end

    describe "Associations" do
      it{should have_many(:pictures)}
      it{should have_and_belong_to_many(:locations)}
    end
end
