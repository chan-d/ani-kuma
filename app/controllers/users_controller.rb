class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if user.save
			flash[:notice] = "Successfully created account!"
			session[:user_id] = user.id
			redirect_to profile_path
		else
			redirect_to '/signup'
		end
	end

  def show
  	@user = User.find_by_id(params[:id])
    if @user != current_user
      redirect_to current_user
    end
  end

private

	def user_params
		params.require(:user).permit(:full_name, :email, :user_name, :password, :password_confirmation)
	end

end
