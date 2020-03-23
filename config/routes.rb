# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_for :upstream, skip: :all

  resources :openings, only: %i[index show]

  namespace :api do
    resources :openings, only: %i[create], defaults: { format: :jsonapi }
  end

  namespace :admin do
    resources :openings
  end

  root to: redirect('/openings')
end
