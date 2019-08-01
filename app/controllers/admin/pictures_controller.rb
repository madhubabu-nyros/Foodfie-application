class Admin::PicturesController < ApplicationController
	def index
    	@pictures = Picture.all
  	end
end
