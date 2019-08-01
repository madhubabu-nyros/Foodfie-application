class RatingsController < ApplicationController
  
  def index   
    @ratings = Rating.all   
  end   
   
  def show   
    @rating = Rating.find(params[:id])   
  end   
  
  def new   
    @rating = Rating.new
  end   
   
  def create
    @dish = Dish.find(params[:dish_id])
    @rating =  @dish.ratings.create(rating_params)
    if @rating.save   
      flash[:notice] = 'Rating added!'   
      redirect_to ratings_path    
    else   
      flash[:error] = 'Failed to edit rating!'   
      render :new   
    end   
  end   
   
  def edit   
    @rating = Rating.find(params[:id])   
  end   

  def update   
    @rating = Rating.find(params[:id])   
    if @rating.update_attributes(rating_params)   
      flash[:notice] = 'Rating updated!'   
      redirect_to ratings_path   
    else   
      flash[:error] = 'Failed to edit Rating!'   
      render :edit   
    end   
  end   
   
  def destroy   
    @rating = Rating.find(params[:id])   
    if @rating.delete   
      flash[:notice] = 'Rating deleted!'   
      redirect_to ratings_path   
    else   
      flash[:error] = 'Failed to delete this Rating!'   
      render :destroy   
    end
  end 

  def rating_params   
    params.require(:rating).permit(:number, :dish_id)   
  end 

end