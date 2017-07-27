class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(name: params[:user][:name])

		if user && user = user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			redirect_to user
		else
			flash[:message] = "Please try to login again"
			redirect_to signin_path
		end
		
	end

	def destroy
		session.clear
		redirect_to root_path
	end



end