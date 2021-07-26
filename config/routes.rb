# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: 'v1',
             controllers: {
               sessions: 'auth/sessions',
               registrations: 'auth/registrations'
             }
  namespace :v1 do
    resources :users, only: %i[index show update]
    resources :companies, only: %i[index show update]
  end
  get '/v1/home', to: 'v1/home#show'

  match '*unmatched', to: 'application#not_found', via: :all
end
