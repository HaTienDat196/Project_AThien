Rails.application.routes.draw do
  as :user do
    get 'signin' => 'devise/sessions#new'
    post 'signin' => 'devise/sessions#create'
    delete 'signout' => 'devise/sessions#destroy'
    get 'user' => 'users/show'
  end
  get 'users/index' => 'users/index'
  devise_for :users
  root to: "users#show"
  resource :user
end
