class HomepagesController < ApplicationController
	  
	def index
 		@count=6
	  if params[:page_no]
	    @count = @count*params[:page_no].to_i
	    @items = Dish.limit(@count)
	  else
	    @items = Dish.limit(@count)
	  end
	  respond_to do |format|
	   format.html
	   format.js
	  end
	end

	def show
    @items = Dish.find(params[:id])
	end

	def search
		if params[:name]
    	@items = Dish.where("name LIKE ?", "#{params[:name]}%")
  	end

  	if params[:price]
  	  @items = Dish.order(params[:price]).where("name LIKE ?", "#{params[:name]}%")
  	end
		if params[:ratings]
			@items = Dish.joins(:ratings).group('dishes.id').having("name LIKE ?", "#{params[:name]}%").order('avg(ratings.number) desc')
		end
		if params[:rating]
			@items = Dish.joins(:ratings).group('dishes.id').having('avg(ratings.number) > ?', params[:rating]).order('avg(ratings.number) desc')
		end
		if params[:category]
		  @items= Dish.where(category_id: params[:category]).where('name LIKE ?',"%#{params[:name]}%")
  	end
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