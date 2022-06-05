# frozen_string_literal: true

Rails.application.routes.draw do
  get 'tests/new'
  get 'tests/create'
  get 'tests/edit'
  get 'tests/update'
  get 'tests/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tests do
    resources :questions, shallow: true
  end
end
