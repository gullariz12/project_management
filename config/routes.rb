# frozen_string_literal: true

Rails.application.routes.draw do
  root 'projects#index'

  devise_for :users,
             controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :projects do
    resources :tasks do
      member do
        patch :assign
      end
    end
  end
end
