class Manager::CharitiesController < Manager::ApplicationController
	skip_before_action :authorize_manager
	before_action :authorize_manager_show

	def show
		@manager = current_manager
		@charity = Charity.find(params[:id])

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

	private

  def authorize_manager_show
		if Charity.find_by!(id: params[:id]).manager
    	manager_id = Charity.find_by!(id: params[:id]).manager.id
	    if current_manager != Manager.find_by!(id: manager_id)
	      redirect_to root_path
	    end
		else
			redirect_to root_path
		end
  end
end
