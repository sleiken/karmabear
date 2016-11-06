class Manager::EventsController < ApplicationController
	def show
		#Display this charity from link
		charity = find(params[:charity_id])
		@event = charity.events.find(params[:event_id])
	end

	def edit
		charity = find(params[:charity_id])
		@event = charity.events.find(params[:event_id])
	end

	def update

	end

	def delete

	end

	def event_params

	end
end
