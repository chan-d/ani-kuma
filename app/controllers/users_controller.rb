class UsersController < ApplicationController
	

	def index
		@users = User.all

	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Successfully created account!"
			session[:user_id] = @user.id
			redirect_to '/users/' + @user.id.to_s
		else
			redirect_to '/signup'
		end
	end

  def show
  	@user = User.find_by_id(params[:id])
  	@reviews= @user.reviews
    if @user != current_user
      redirect_to current_user
    end
  end

  def edit
  	@user = User.find_by_id(params[:id])
  end

  def update
  	@user = User.find_by_id(params[:id])
  	@user.update_attributes(user_params)
  	redirect_to user_path(@user.id)
  end


private

	def user_params
		params.require(:user).permit(:full_name, :email, :user_name, :password, :password_confirmation, :about_me)
	end

end
