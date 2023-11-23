# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'api/v1/users#index'

  get '/current_user', to: 'current_user#index'
  get '/logout', to: 'users/sessions#destroy'
  
  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index create destroy] do
        resources :cars, only: %i[index create destroy]
      end
      resources :items, only: %i[index create destroy show]
      resources :reservations, only: %i[index create destroy]
    end
  end
end
