Rails.application.routes.draw do
  get 'users/index' => 'users/index'
  root to: "users#show"
  resource :user

  as :user do
    get 'signin' => 'devise/sessions#new'
    post 'signin' => 'devise/sessions#create'
    delete 'signout' => 'devise/sessions#destroy'
  end

 devise_for :users,
    controllers:{omniauth_callbacks: "user/omniauth_callbacks"}
end
