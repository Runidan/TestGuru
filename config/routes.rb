# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tests#index'

  get :singup, to: 'users#new'
  get :login, to: 'session#new'
  
  resources :users, only: :create
  resources :sessions, only: :create
  
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, exept: :index
    end

    member do
      post :start
    end
  end

  # get /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
