class Manager::EventsController < Manager::ApplicationController
	before_action :charity
	before_action :event, only: [:edit, :update, :destroy]

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
			render "manager/events#show"
		end
	end

	def edit
	end

	def update
		if @event.update(event_params)
			redirect_to manager_charity_event_url(@charity, @event)
		else
			@errors = @event.errors.full_messages
			render "manager/events#edit"
		end
	end

	def destroy
		@event.destroy

		redirect_to manager_charity_events_url(@charity)
	end

	private

	def event_params
		params.require(:event).permit(:name, :description, :start, :end, :givers_needed)
	end

	def charity
		@charity ||= Charity.find(params[:charity_id])
	end

	def event
		@event ||= Event.find(params[:id])
	end
end
