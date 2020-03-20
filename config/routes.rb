# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  namespace :api do
    resources :openings, only: %i[create], defaults: { format: :jsonapi }
  end
end
