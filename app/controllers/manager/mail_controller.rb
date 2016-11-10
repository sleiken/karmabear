class Manager::MailController < ApplicationController
  def show
    render partial: 'manager/modals/mailer'
  end

  def followers
    
  end
end
