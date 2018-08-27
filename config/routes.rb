# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#index'
  resource :users, only: %i[index show edit update] do
    get 'editpassword', on: :member
    get 'show', on: :member
    get 'edit', on: :member
  end

  as :user do
    get 'sign_up' => 'devise/registrations#new'
    get 'sign_in' => 'devise/sessions#new'
    post 'sign_in' => 'devise/sessions#create'
    delete 'sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
