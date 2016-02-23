module MoviesHelper

	def current_movie
		@current_movie = Movie.find_by_id(params[:id])
	end
end
