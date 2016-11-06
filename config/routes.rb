Rails.application.routes.draw do
  root 'main#index'
  get 'home', to: 'main#index'

  post '/search' => 'main#search', as: :search

  devise_for :managers
  devise_for :givers

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

  get ':username', to: 'givers#show', as: :giver
end
