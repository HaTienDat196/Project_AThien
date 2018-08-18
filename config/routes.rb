Rails.application.routes.draw do
  as :user do
    get 'signin' => 'devise/sessions#new'
    post 'signin' => 'devise/sessions#create'
    delete 'signout' => 'devise/sessions#destroy'
  end
  get 'users/index'
  devise_for :users
  root to: "users#index"
end
