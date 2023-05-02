# frozen_string_literal: true

Rails.application.routes.draw do
  root "projects#index"

  devise_for :users,
             controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :projects
end
