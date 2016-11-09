class Manager::EventsController < Manager::ApplicationController
	before_action :find_charity
	before_action :find_event, only: [:show, :edit, :update, :destroy]

	def index
		@events = charity.events
	end

	def show
		@givers = @event.givers
	end

	def new
		@event = Event.new
	end

	def create
		@event = @charity.events.new(event_params)

		if @event.save
			redirect_to manager_charity_path(@charity)
		else
			@errors = @event.errors.full_messages
			render "manager/events#show"
		end
	end

	def edit
	end

	def update
		if @event.update(event_params)
			redirect_to manager_charity_url(@charity)
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

	def find_charity
		@charity ||= Charity.find(params[:charity_id])
	end

	def find_event
		@event ||= Event.find(params[:id])
	end
end
