class Manager::CharitiesController < Manager::ApplicationController

	def show
		# until oauth/user auth is decided, the below should remain commented out
		# manager = current_manager
		# @charity = manager.charity
		@charity = Charity.find(params[:id])
		@manager = @charity.manager
    @events = @charity.events
    @needs = @charity.needs
    @registrations = @charity.registrations
    @registration = Registration.find_by(id: params[:id])
    @donations = @charity.donations
    @need = Need.new
    @event = Event.new
	end

end
