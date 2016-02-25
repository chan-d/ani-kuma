class MoviesController < ApplicationController
	skip_before_filter :verify_authenticity_token
	
	def index
		@movies = Movie.all
	end


	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			flash[:notice] = "Successfully created movie!"
			
			redirect_to '/movies'
		else
			flash[:notice] = "Error! Cannot create movie!"
		end
		
	end

	def show
		@movie = Movie.find_by_id(params[:id])
	end


	private

	def movie_params
		params.require(:movie).permit(:e_title, :j_title, :img_url, :synopsis)
	end
end
