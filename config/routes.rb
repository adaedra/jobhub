# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :openings, only: %i[index show]

  namespace :api do
    resources :openings, only: %i[create], defaults: { format: :jsonapi }
  end

  namespace :admin do
    resources :openings
  end
end
