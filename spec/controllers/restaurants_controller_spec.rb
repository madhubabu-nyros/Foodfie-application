require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe Admin::RestaurantsController, type: :controller do


let(:valid_attributes) {
    {name: 'fdsff'}
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

	context 'GET #show' do
  	it 'returns a success response' do
        restaurant = Restaurant.create!(name: 'kokila')
    		get :show, params: { id: restaurant.to_param }
    		expect(response).to be_success
  	end
	end
	
	context 'GET #new' do
  	it 'returns a success response' do
    		get :new
    		expect(response).to be_success
  	end
	end

  context "GET #edit" do
    it "assigns the requested restaurant as @restaurant" do
      restaurant = Restaurant.create!(name: 'dfsf')
      get :edit, params: { :id => restaurant.to_param }
      expect(assigns(:restaurant)).to eq(restaurant)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Restaurant" do
        expect {
          post :create, params: {restaurant: valid_attributes}, session: valid_session
        }.to change(Restaurant, :count).by(1)
      end

      it "redirects to the created restaurant" do
        post :create, params: {restaurant: valid_attributes}, session: valid_session
        expect(response).to redirect_to(admin_restaurants_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {restaurant: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'hfghfg'}
      }

      it "updates the requested restaurant" do
        restaurant = Restaurant.create! valid_attributes
        put :update, params: {id: restaurant.to_param, restaurant: new_attributes}, session: valid_session
        restaurant.reload
      end

      it "redirects to the restaurant" do
        restaurant = Restaurant.create! valid_attributes
        put :update, params: {id: restaurant.to_param, restaurant: valid_attributes}, session: valid_session
        expect(response).to redirect_to(admin_restaurants_path)
      end
    end
    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        restaurant = Restaurant.create! valid_attributes
        put :update, params: {id: restaurant.to_param, restaurant: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end
  describe "DELETE #destroy" do
    it "destroys the requested restaurant" do
      restaurant = Restaurant.create! valid_attributes
      expect {
        delete :destroy, params: {id: restaurant.to_param}, session: valid_session
      }.to change(Restaurant, :count).by(-1)
    end

    it "redirects to the places list" do
      restaurant = Restaurant.create! valid_attributes
      delete :destroy, params: {id: restaurant.to_param}, session: valid_session
      expect(response).to redirect_to(admin_restaurants_path)
    end
  end
end