class ReviewsController < ApplicationController
	

	def index
		@reviews = Review.all
	end

	def new
		@review = Review.new 
		render :new_review
	end

	def create
		@review = Review.new(review_params)
		if @review.save
			flash[:notice] = 'review posted'
			redirect_to '/movies'
		else
			flash[:notice] = "error- review not posted"
		end
	end

	def show
		@review = Review.find_by_id(params[:id])
	end

	def edit
		@review = Review.find_by_id(params[:id])
	end

	def update
		@review= Review.find_by_id(params[:id])
		@review.update_attributes(review_params)
		redirect_to user_path(current_user.id)
	end

	def destroy
		@review = Review.find_by_id(params[:id])
		@review.destroy
		flash[:notice] = 'Successfully deleted review'
		redirect_to user_path(current_user.id)
	end

	private

	
	def review_params
		params.require(:review).permit(:title, :review, :user_id, :movie_id, :movie_name, :user_name)
	end
end
