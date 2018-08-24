# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/show' => 'users/show'
  get 'users/edit' => 'users/edit'
  root to: 'users#index'
  resource :users, only: %i[index show edit update]

  as :user do
    get 'sign_up' => 'devise/registrations#new'
    get 'sign_in' => 'devise/sessions#new'
    post 'sign_in' => 'devise/sessions#create'
    delete 'sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
