class Givers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @giver = Giver.from_omniauth(request.env["omniauth.auth"])

    if @giver.persisted?
      sign_in_and_redirect @giver, :event => :authentication #this will throw if @giver is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_giver_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
