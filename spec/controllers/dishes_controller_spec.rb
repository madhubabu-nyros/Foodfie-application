require 'rails_helper'

RSpec.describe Admin::DishesController, type: :controller do

	context 'GET #index' do
  	it 'returns a success response' do
    		get :index
    		expect(response).to be_success
  	end
	end

	context 'GET #show' do
  	it 'returns a success response' do
    		dish = Dish.create!(name: 'chicken fry', price:120 ,category_id:1)
    		get :show, params: { id: dish.to_param }
    		expect(response).to be_success
  	end
	end

	context 'GET #new' do
  	it 'returns a success response' do
    		get :new
    		expect(response).to be_success
  	end
	end

  context 'GET #edit' do
    it 'returns a success response' do
      dish = Dish.create!(name: 'chicken', price:120,category_id: 1)
      get :edit, params: { id: dish.to_param }
      expect(response).to be_success
    end
  end

  context 'POST #create' do
    it 'returns a success response' do
      restaurant = FactoryBot.create(:restaurant, name: Faker::Name.name)
      post :create, params: { restaurant_id: restaurant.id, dish: {restaurant_ids:[restaurant.id]}, format: 'js' }
      expect(response).to have_http_status(:success)
    end
  end

  context 'POST #Update' do
    it 'returns a success response' do
      restaurant = FactoryBot.create(:restaurant, name: Faker::Name.name)
      dish = Dish.create!(name: 'chicken', price:120, category_id: 1)
      put :update, params: { id: dish.to_param, dish: {restaurant_ids:[restaurant.id]}, format: 'js' }
      expect(response).to have_http_status(:success)
    end  
  end 
end
