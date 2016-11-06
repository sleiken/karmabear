Rails.application.routes.draw do
  devise_for :managers
  devise_for :givers

  root "manager/events#show"

end
