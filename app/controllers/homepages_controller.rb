class HomepagesController < ApplicationController
	  
	def index
	  @items = Dish.paginate(:page => params[:page], :per_page => 6)
	  respond_to do |format|
	   format.html
	   format.js
	  end
	end

	def show
    @items = Dish.find(params[:id])
	end

	def search 
		map
		if params[:name]
    	@items = Dish.search(params[:name])
  	end
  	if params[:price]
  	 	@items = Dish.sortby_price(params[:price]).search(params[:name])
  	end
		if params[:ratings]
			@items = Dish.sortby_ratings(params[:name])
		end
		if params[:rating]
			@items = Dish.sortby_rating(params[:rating])
		end
		if params[:category]
		  @items= Dish.sortby_dietary(params[:category]).search(params[:name])
  	end
	end
	private
		def map
			@items = Dish.where("name LIKE ?", "#{params[:name]}%")
			restaurants = []
    	locations = []
   		@items.each do |d|
    		@restaurants = d.restaurants
       	restaurants.push(@restaurants)
    			d.restaurants.each do |r|
    				@locations = r.locations
      			locations.push(@locations)
     			end	
    	end  
    	gon.restaurants = restaurants
    	gon.locations = locations	
		end
end