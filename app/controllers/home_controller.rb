class HomeController < ApplicationController
	  def index
	  	@search = Proper.search(params[:search])
    	@propers = @search.all
    	
      	respond_to do |format|
      		format.html # index.html.erb
      		format.json { render json: @propers }
      	end
      end
end
