Rails.application.routes.draw do
  root 'main#index'
  get 'home', to: 'main#index'

  get 'users/:username', to: 'givers#show', as: :giver

  devise_for :managers
  devise_for :givers, :controllers => { :omniauth_callbacks => "givers_omniauth_callbacks" }

  namespace :manager do
    root 'charities#show'

    resources :charities, only: [:show] do
      resources :givers, only: [:index, :show]
      resources :events do
        resources :givers, only: [:index, :show]
        resources :registrations, only: [:index, :show, :update, :destroy]
      end
      resources :needs do
        resources :givers, only: [:index, :show]
        resources :donations, only: [:index, :show, :update, :destroy]
      end
    end
  end

  resources :charities, only: [:index, :show] do
    resources :subscriptions, only: [:create, :destroy]
    resources :events, only: :show do
      resources :registrations, except: :index
    end
    resources :needs, only: :show do
      resources :donations, except: :index
    end
  end

  namespace :api, defaults: { format: :json } do
    post 'search', to: 'api#search'
    get 'charities', to: 'api#charities'
    post 'auth/verify', to: 'auth#verify'
    get 'auth/giver_profile', to: 'auth#giver_profile'
    get 'auth/test', to: 'auth#test'
  end
end
