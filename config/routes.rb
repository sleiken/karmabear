Rails.application.routes.draw do
  devise_for :managers
  devise_for :givers

  namespace :manager do
    resources :charities, only: [:show] do
      resources :events
      resources :needs
    end
  end

  resources :charities, only: [:index, :show] do
    resources :events, only: [:show]
    resources :needs, only: [:show]
  end

  resources :profile, only: [:show], controller: 'givers'
end
