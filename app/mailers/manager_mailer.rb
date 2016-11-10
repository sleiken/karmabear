class ManagerMailer < ApplicationMailer
  default from: "karmabearapp@gmail.com"

  def welcome_email(giver)
    @giver = giver
    #url to use in email body
    # @url =
    mail(to: @giver.email, subject: 'Welcome to My Awesome Site')
  end

  def follower_email(manager, subject, body)
    mail(bcc: manager.charity.followers,
         subject: subject,
         body: body)
  end
end
