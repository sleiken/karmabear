class Manager::EventsController < Manager::ApplicationController
	before_action :find_charity

	def index
		@events = @charity.events
	end

	def show
		#Display this charity from link
		@event = @charity.events.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = @charity.events.new(event_params)

		if @event.save
			redirect_to manager_charity_event_path(@charity, @event)
		else
			@errors = @event.errors.full_messages
			render "manager/charities#show"
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@event.update(event_params)
		redirect_to manager_charity_event_url(@charity, @event)
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy

		redirect_to manager_charity_events_url(@charity)
	end

	private

	def event_params
		params.require(:event).permit(:name, :description, :start, :end, :givers_needed)
	end

	def find_charity
		@charity = Charity.find(params[:charity_id])
	end

end
