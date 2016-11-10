class Manager::MailController < ApplicationController
  def show
    render partial: 'manager/modals/mailer'
  end

  def followers
    ManagerMailer.follower_email(current_manager, params[:subject], params[:body]).deliver_later
  end
end
