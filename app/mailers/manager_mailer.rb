class ManagerMailer < ApplicationMailer
  default from: "karmabearapp@gmail.com"

  def welcome_email(giver)
    @giver = giver
    mail(to: @giver.email, subject: 'Welcome to My Awesome Site')
  end

  def follower_email(manager, subject, body)
    recipients = manager.charity.followers
    mail(bcc: recipients.map(&:email).uniq.last(25),
         subject: subject,
         body: body)
  end
end
