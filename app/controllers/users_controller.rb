class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_current_user, only: [:edit]


	def show
		@book = Book.new
		@books = Book.all
		@user = User.find(params[:id])
	end

	def index
		@book = Book.new
		@users = User.all
	end

	def update
		@user = User.find(params[:id])
		if @user.update (user_params)
			flash[:notice] = "You have updeted user successfully."
      		redirect_to user_path(@user.id)
    	else
    		flash[:notice] = "You haven't updated user error"
      		render "edit"
    	end
	end

	def edit
		@user = User.find(params[:id])
	end


	private
	def user_params
		 params.require(:user).permit(:name, :introduction, :profile_image)
	end
	def ensure_current_user
		if current_user.id != params[:id].to_i
			redirect_to user_path(current_user)
		end

	end
end
