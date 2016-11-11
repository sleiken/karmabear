class Manager::CharitiesController < Manager::ApplicationController

	def show
		# until oauth/user auth is decided, the below shoulmd remain commented out
		# manager = current_manager
		# @charity = manager.charity
		@charity = Charity.find(params[:id])
		@manager = @charity. manager

    @followers = @charity.followers
    @volunteers = @charity.volunteers
    @donors = @charity.donors

    @registrations = @charity.registrations.pending
    @donations = @charity.donations.pending
		@notifications = @manager.notifications.for_display

    @events = @charity.events
    @needs = @charity.needs

    @event = Event.new
    @need = Need.new
	end

end
