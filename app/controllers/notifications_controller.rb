
class NotificationsController < ApplicationController
  def index
    @manager = $current_manager
    @notifications = Notification.for_display
  end

  def mail
    ManagerMailer.welcome_email(Giver.find_by(username: "samleiken")).deliver_later
    render json: "Email sent".to_json
  end
end
