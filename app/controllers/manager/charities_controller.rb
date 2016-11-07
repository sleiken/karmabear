class Manager::CharitiesController < Manager::ApplicationController

	def show
		# until oauth/user auth is decided, the below should remain commented out
		# manager = current_manager
		# @charity = manager.charity
		@charity = Charity.find(params[:id])
		@manager = @charity.manager
	end

end
