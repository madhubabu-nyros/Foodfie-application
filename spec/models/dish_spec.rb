require 'rails_helper'

RSpec.describe Dish, type: :model do
   	it 'ensures name presence' do 
      dish = Dish.new(category_id: 1).save
      expect(dish).to eq(false)
    end

    it 'ensures price presence' do 
      dish = Dish.new(price:'' ).save
      expect(dish).to eq(false)
    end
    it 'ensures category_id presence' do 
      dish = Dish.new(name: 'chicken fry').save
      expect(dish).to eq(false)
    end

    it 'should save successfully' do 
      dish = Dish.new(name: 'chicken fry', price:120, category_id: 1).save
      expect(dish).to eq(true)
    end


end
