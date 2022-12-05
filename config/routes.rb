# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: 'login', sign_out: 'logout' }

  get '/pages/feedback', to: 'pages#feedback'
  post '/pages/feedback', to: 'pages#send_feedback'
  get '/pages/:page', to: 'pages#show'

  resources :tests, only: :index do
    post :start, on: :member
  end

  # get /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      resources :gists, only: :create
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, exept: :index
      end
    end

    resources :gists, only: :index
  end
end
