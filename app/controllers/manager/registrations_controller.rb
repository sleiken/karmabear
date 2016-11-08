class Manager::RegistrationsController < Manager::ApplicationController
  def index

  end

  def show

  end

  def update
    # after manager clicks "approve":
    # add pending_hours to approved_hours
    # update user points
    # close modal with js
  end

  def destroy
     # after manager clicks "deny":
     # destroy registration object
     # close modal with js
  end
end
