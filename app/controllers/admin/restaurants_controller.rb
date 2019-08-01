class Admin::RestaurantsController < ApplicationController
  
    def index   
        @restaurants = Restaurant.paginate(:page => params[:page], :per_page => 10)   
    end   
   
    def show   
        @restaurant = Restaurant.find(params[:id])
    end   

    def new   
        @restaurant = Restaurant.new 
        @restaurant.pictures.build  
    end   
   
    def create   
        @restaurant = Restaurant.new(restaurant_params)   
        if @restaurant.save   
            flash[:notice] = 'restaurant added!'   
            redirect_to admin_restaurants_path   
        else   
            flash[:error] = 'Failed to edit restaurant!'   
            render :new   
        end   
    end   
   
    def edit   
        @restaurant = Restaurant.find(params[:id])
    end   
    def update   
        @restaurant = Restaurant.find(params[:id])   
        if @restaurant.update_attributes(restaurant_params)   
            flash[:notice] = 'Restaurant updated!'   
            redirect_to admin_restaurants_path   
        else   
            flash[:error] = 'Failed to edit Restaurant!'   
            render :edit   
        end   
    end   
    def destroy   
        @restaurant = Restaurant.find(params[:id])
        if @restaurant.delete   
            flash[:notice] = 'Restaurant deleted!'   
            redirect_to admin_restaurants_path   
        else   
            flash[:error] = 'Failed to delete this Restaurant!'   
            render :destroy   
        end   
    end   

    private
    def restaurant_params   
        params.require(:restaurant).permit(:name, pictures_attributes: [:id, :name])   
    end
end