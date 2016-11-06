class Manager::EventsController < Manager::ApplicationController
	def new
		#Should actually refer to current_user
		manager = Manager.find(1)
		@charity = manager.charity
	end

	def create
		@charity = Charity.find(params[:charity_id])
		@event = @charity.events.new(event_params)

		if @event.save
			p @charity
			p @event
			redirect_to manager_charity_path(@charity)
		else
			render "manager/charities#show"
		end
	end

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
end
