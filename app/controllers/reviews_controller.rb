class ReviewsController < ApplicationController
	belongs_to :user

	def index
		@reviews = Review.all 
	end

	def new
		
	end

	def create
		@review = Review.new(review_params)
		if @reviews.save
			flash[:notice] = 'review posted'
		else
			flash[:notice] = "error- review not posted"
		end
	end

	def show
		@review = Review.find_by_id(params[:id])
	end

	private
	
	def review_params
		params.require(:review).permit(:title, :review)
	end
end
