class AttractionsController < ApplicationController

	before_action :is_admin, only: [:new, :create, :edit, :update]

	def index
		@attractions = Attraction.all 
	end

	def new
		@attraction = Attraction.new
	end

	def create
		# only if you're an admin
		@attraction = Attraction.create(attraction_params)
		redirect_to attraction_path(@attraction)
	end

	def show
		@attraction = Attraction.find(params[:id])
		@user = current_user
	end

	def edit
		# only works for admins
		@attraction = Attraction.find(params[:id])
	end

	def update
		# only available to admins
		@attraction = Attraction.find(params[:id])
		@attraction.update(attraction_params)
		redirect_to attraction_path(@attraction)
	end

	def ride
		@ride = current_user.rides.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
		flash[:message] = @ride.take_ride	

		redirect_to user_path(current_user)
	end

	private
	def attraction_params
		params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
	end

end
