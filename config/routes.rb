# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :tests, only: :index do
    post :start, on: :member
  end

  # get /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
<<<<<<< HEAD
      resources :gists, only: :create
=======
>>>>>>> 25a9245d346024f5dd654011308e691d7c23c1ef
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, exept: :index
      end
    end

    resources :gists, only: :index
  end
end
