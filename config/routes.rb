Rails.application.routes.draw do
  root 'main#index'
  get 'home', to: 'main#index'

  get 'users/:username', to: 'givers#show', as: :giver

  devise_for :managers
  devise_for :givers, :controllers => { :omniauth_callbacks => "givers_omniauth_callbacks" }

  namespace :manager do
    root 'charities#show'

    resources :charities, only: [:show, :edit, :update] do
      resources :givers, only: [:index, :show]
      resources :events
      resources :needs
    end
  end

  resources :charities, only: [:index, :show] do
    resources :events, only: [:show]
    resources :needs, only: [:show]
  end

  namespace :api, defaults: { format: :json } do
    post 'search', to: 'api#search'
    get 'charities', to: 'api#charities'
    get 'giver_profile', to: 'api#giver_profile'
  end
end
