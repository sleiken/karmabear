Rails.application.routes.draw do
  # root :
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

  # resources :profile, param: :username, only: [:show], controller: 'givers'
  get ':username', to: 'givers#show', as: :giver
end
