# frozen_string_literal: true

Rails.application.routes.draw do
  get 'user/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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
