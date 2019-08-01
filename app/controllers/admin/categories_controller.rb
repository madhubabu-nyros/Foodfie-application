class CategoriesController < ApplicationController
    def index   
        @categories = Category.all   
    end   
   
    def show   
        @category = Category.find(params[:id])   
    end   
  
    def new   
        @category = Category.new   
    end   
   
    def create   
        @category = Category.new(category_params)   
        if @category.save   
            flash[:notice] = 'category added!'   
            redirect_to categories_path    
        else   
            flash[:error] = 'Failed to edit category!'   
            render :new   
        end   
    end   
   
    def edit   
        @category = Category.find(params[:id])   
    end   

    def update   
        @category = Category.find(params[:id])   
        if @category.update_attributes(category_params)   
            flash[:notice] = 'Category updated!'   
            redirect_to categories_path   
        else   
            flash[:error] = 'Failed to edit Category!'   
            render :edit   
        end   
    end   
   
    def destroy   
        @category = Category.find(params[:id])   
        if @category.delete   
            flash[:notice] = 'Category deleted!'   
            redirect_to categories_path   
        else   
            flash[:error] = 'Failed to delete this Category!'   
            render :destroy   
        end   
    end   

    private
    def category_params   
        params.require(:category).permit(:name)   
    end   
end
