class Manager::EventsController < Manager::ApplicationController
	before_action :find_charity

	def index
		@events = @charity.events
	end

	def new
		@event = Event.new
	end

	def create
		@event = @charity.events.new(event_params)

		if @event.save
			redirect_to manager_charity_path(@charity)
		else
			render "manager/charities#show"
		end
	end

	def show
		#Display this charity from link
		@event = @charity.events.find(params[:id])
	end

	def edit
		charity = find(params[:charity_id])
		@event = charity.events.find(params[:event_id])
	end

	def update
		@charity = find(params[:charity_id])
		@event = charity.events.find(params[:id])
		@event.update(event_params)
		redirect_to redirect_to manager_charity_path(@charity)
	end

	def delete
		charity = find(params[:charity_id])
		@event = charity.events.find(params[:id])
		@event.destroy
	end

	private

	def event_params
		params.require(:event).permit(:name, :description, :start, :end, :givers_needed)
	end

	def find_charity
		@charity = Charity.find(params[:charity_id])
	end

end
