require 'rails_helper'

RSpec.describe Admin::LocationsController, type: :controller do

	context 'GET #index' do
  	it 'returns a success response' do
    	get :index
    	expect(response).to be_success
  	end
  end

	context 'GET #show' do
  	it 'returns a success response' do
    	location = Location.create!(city: 'kakinda',street: 'bhanugudi', state: 'ap', country: 'india', pincode: 533003)
    	get :show, params: { id: location.to_param }
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
      location = Location.create!(city: 'kakinda',street: 'bhanugudi', state: 'ap', country: 'india', pincode: 533003)
      get :edit, params: { id: location.to_param }
        expect(response).to be_success
    end
  end
  

  context 'POST #create' do
    it 'returns a success response' do
      restaurant = FactoryBot.create(:restaurant, name: Faker::Name.name)
      post :create, params: { restaurant_id: restaurant.id, location: {restaurant_ids:[restaurant.id]}, format: 'js' }
      expect(response).to have_http_status(:success)
    end
  end

  context 'POST #Update' do
    it 'returns a success response' do
      restaurant = FactoryBot.create(:restaurant, name: Faker::Name.name)
      location = Location.create!(city: 'kakinda', street: 'bhanugudi', state: 'ap', country: 'india', pincode: 533003)
      put :update, params: { id: location.to_param, location: {restaurant_ids:[restaurant.id]}, format: 'js' }
      expect(response).to have_http_status(:success)
    end  
  end  
end