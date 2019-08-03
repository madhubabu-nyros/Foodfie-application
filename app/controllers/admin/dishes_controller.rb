class Admin::DishesController < ApplicationController
    def index   
        @dishes = Dish.paginate(:page => params[:page], :per_page => 10)   
    end   
 
    def show   
        @dish = Dish.find(params[:id])   
    end   
    def new   
        @dish = Dish.new
        @dish.pictures.build  
    end   
   
    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        @dish =  @restaurant.dishes.create(dish_params)
        if @dish.save   
            flash[:notice] = 'dish added!'   
            redirect_to admin_restaurants_path    
        else   
            flash[:error] = 'Failed to edit dish!'   
            render :new   
        end   
    end   
   
    def edit   
        @dish = Dish.find(params[:id])
    end   

    def update   
        @dish = Dish.find(params[:id])   
        if @dish.update_attributes(dish_params)   
            flash[:notice] = 'Dish updated!'   
            redirect_to admin_restaurants_path   
        else   
            flash[:error] = 'Failed to edit Dish!'   
            render :edit   
        end   
    end   
   
    def destroy   
        @dish = Dish.find(params[:id])   
        if @dish.delete   
            flash[:notice] = 'Dish deleted!'   
            redirect_to admin_dishes_path   
        else   
            flash[:error] = 'Failed to delete this Dish!'   
            render :destroy   
        end
    end 

    private
    def dish_params   
        params.require(:dish).permit(:name, :price, :category_id, :restaurant_id, pictures_attributes: [:id, :name])   
    end 
end
