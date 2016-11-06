class Manager::CharitiesController < ApplicationController
	# def new
	# end

	# def index
	# end

	def show
		#Show the main dashboard information, drill into associations to get view data.
		#Should actually be current user.
		manager = Manager.find(1)
		@charity = manager.charity
	end

	def edit
		#Find the current charity to edit, use this charity in #update to modify db.
		@charity = Charity.find(params[:charity_id])
	end

	def update
		#At this charity take form data to update attributes about charity.
		#Pass default values from DB into form so only targeted data is changed.
		@charity.update(charity_params)
		redirect_to "charity#show"
	end

	def charity_params
		params.require(:charity).permit(:name, :lat, :lng, :address, :description, :phone, :url)
	end
end