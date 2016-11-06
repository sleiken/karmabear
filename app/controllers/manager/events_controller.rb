class Manager::EventsController < ApplicationController
	def new 
		@charity = Charity.new
	end

	def create
		@charity = Charity.find(params[:charity_id])
		@event = charity.events.new(event_params)

		if @event.save
			redirect_to manager_charity_path(@charity)
		else
			render "manager/charities#show"
		end
	end

	# def index
	# end

	def show
		#Display this charity from link
		charity = find(params[:charity_id])
		@event = charity.events.find(params[:id])
	end

	def edit
		charity = find(params[:charity_id])
		@event = charity.events.find(params[:event_id])
	end

	def update
		charity = find(params[:charity_id])
		@event = charity.events.find(params[:id])
		@event.update(event_params)
	end

	def delete
		charity = find(params[:charity_id])
		@event = charity.events.find(params[:id])
		@event.destroy
	end

	def event_params
		params.require(:event).permit(:name, :description, :start, :end, :givers_needed)
	end
end
