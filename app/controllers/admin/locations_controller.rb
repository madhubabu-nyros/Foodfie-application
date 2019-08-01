class Admin::LocationsController < ApplicationController
    def index   
        @locations = Location.all   
    end   
   
    def show   
        @location = Location.find(params[:id])   
    end   
  
    def new   
        @location = Location.new   
     end   
   
    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        @location =  @restaurant.locations.create(location_params)
        if @location.save   
            flash[:notice] = 'Location added!'   
            redirect_to admin_locations_path    
        else   
            flash[:error] = 'Failed to edit location!'   
            render :new   
        end   
    end   
   
    def edit   
        @location = Location.find(params[:id])   
    end   

    def update   
        @location = Location.find(params[:id])   
        if @location.update_attributes(location_params)   
            flash[:notice] = 'Location updated!'   
            redirect_to admin_locations_path   
        else   
            flash[:error] = 'Failed to edit Location!'   
            render :edit   
        end   
    end   
  
    def destroy   
        @location = Location.find(params[:id])   
        if @location.delete   
            flash[:notice] = 'Location deleted!'   
            redirect_to admin_locations_path   
        else   
            flash[:error] = 'Failed to delete this Location!'   
            render :destroy   
        end
    end 
    private
    def location_params   
        params.require(:location).permit(:street, :city, :state, :pincode, :country, :restaurant_id)   
    end 
end
