require 'rails_helper'

RSpec.describe Location, type: :model do
  	
    it 'ensures city presence' do
      location = Location.new(street: 'bhanugudi', state: 'ap', country: 'india', pincode: 533003).save
      expect(location).to eq(false)
    end

    it 'ensures pincode presence' do
      location = Location.new( city: 'kakinada', street: 'bhanugudi', state: 'ap', country: 'india',).save
      expect(location).to eq(false)
    end

    it 'ensures street presence' do
      location = Location.new( city: 'kakinada', state: 'ap', country: 'india', pincode: 533003).save
      expect(location).to eq(false)
    end
    
    it 'ensures state presence' do
      location = Location.new( city: 'kakinada', street: 'bhanugudi', country: 'india', pincode: 533003).save
      expect(location).to eq(false)
    end

    it 'ensures country presence' do
      location = Location.new( city: 'kakinada', street: 'bhanugudi', state: 'ap', pincode: 533003).save
      expect(location).to eq(false)
    end

    it 'should save successfully' do 
      location = Location.new( city: 'kakinada', street: 'bhanugudi', state: 'ap', pincode: 533003, country: 'India').save
      expect(location).to eq(true)
    end
    describe "Associations" do
      it{should have_and_belong_to_many(:restaurants)}
    end
end
