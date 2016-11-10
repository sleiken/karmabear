# Preview all emails at http://localhost:3000/rails/mailers/manager_mailer
class ManagerMailerPreview < ActionMailer::Preview
  def welcome_email
    ManagerMailer.welcome_email(Giver.first)
  end

  def follower_email
    ManagerMailer.follower_email(Manager.first, "sdfsdfsdf", "sdfsfkfhwekbfekw")
  end
end
