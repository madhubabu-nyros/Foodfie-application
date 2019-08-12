require 'rails_helper'

RSpec.describe Admin::RatingsController, type: :controller do

let(:valid_attributes) {
    {number: 5, dish_id: 32}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }
  let(:valid_session) { {} }

	context 'GET #index' do
  		it 'returns a success response' do
    		get :index
    		expect(response).to be_success
  		end
	end

	context 'GET #new' do
    	it 'returns a success response' do
      		get :new
      		expect(response).to be_success
    	end
  	end
	context 'GET #show' do
    	it 'returns a success response' do
      		rating = Rating.create!(number: 4, dish_id: 23)
      		get :show, params: { id: rating.to_param }
      		expect(response).to be_success
    	end
  	end
  	context 'GET #edit' do
    	it 'returns a success response' do
      		rating = Rating.create!(number: 4, dish_id: 23)
      		get :edit, params: { id: rating.to_param }
    	  	expect(response).to be_success
   	 	end
    end

    context 'POST #create' do
    	it 'returns a success response' do
      		dish = Dish.create!(name: 'chicken', price:120,category_id: 1)
      		post :create, params: { dish_id: dish.id, rating: {dish_ids:[dish.id]}, format: 'js' }
	      	expect(response).to have_http_status(:success)
    end

    context 'POST #Update' do
    	it 'returns a success response' do
      		dish = Dish.create!(name: 'chicken', price:120, category_id: 1)
      		rating = Rating.create!(number: 4, dish_id: 23)
      		put :update, params: { id: rating.to_param, rating: {dish_ids:[dish.id]}, format: 'js' }
      		expect(response).to have_http_status(:success)
    	end  
 	end
  end
end
