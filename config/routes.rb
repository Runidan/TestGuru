# frozen_string_literal: true

Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tests do
    resources :questions, shallow: true, except: [:index]
      resources :answers, shallow: true
  end
end
