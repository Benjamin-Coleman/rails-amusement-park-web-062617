class UsersController < ApplicationController
	before_action :logged_in, only: [:show]

	def new
		@user = User.new
	end


	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to new_user_path
		end
	end


	def show
		@user = User.find_by(id: params[:id])
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
		@user = User.find_by(id: params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			flash[:message] = "You have endered invalid data"
			redirect_to edit_user_path
		end
	end



	private 
	def user_params 
		params.require(:user).permit(:name, :password, :height, :happiness, :tickets, :nausea, :admin) 
	end


end
