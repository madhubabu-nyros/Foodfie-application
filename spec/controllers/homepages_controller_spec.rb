require 'rails_helper'

RSpec.describe HomepagesController, type: :controller do

	context 'GET #index' do
  		it 'returns a success response' do
    		get :index
    		expect(response).to be_success
  		end
	end

	context '#search' do
    it "search dishes by name" do
      get :search, { :params => {:name => 'chicken'}}
      controller.params[:name].should eql 'chicken'
      expect(response).to be_success
    end
    
    it "sort dishes by price" do
      get :search, { :params => {:price => 'price'}}
      controller.params[:price].should eql 'price'
      expect(response).to be_success
    end

    it "sort dishes by ratings" do
      get :search, { :params => {:ratings => 'ratings'}}
      controller.params[:ratings].should eql 'ratings'
      expect(response).to be_success
    end

    it "sort dishes by rating" do
      get :search, { :params => {:rating => 'rating'}}
      controller.params[:rating].should eql 'rating'
      expect(response).to be_success
    end

    it "sort dishes by category" do
      get :search, { :params => {:category => 'category'}}
      controller.params[:category].should eql 'category'
      expect(response).to be_success
    end

    it "display dishes belongs to restaurant" do
      restaurant = FactoryBot.create(:restaurant, name: Faker::Name.name)
      get :search, { :params => {:restaurant => restaurant.id}}
      controller.params[:restaurant].should eql restaurant.id.to_s
      expect(response).to be_success
    end
	end
end