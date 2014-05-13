Rails.application.routes.draw do
  match 'explore/:api' => 'api#explore', as: :explore_api, via: :get

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", sessions: 'users/sessions'}
  devise_scope :user do
    # get 'signin' => 'devise/sessions#new', :as => :new_user_session
    # post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'sign_out' => 'users/sessions#destroy', :as => :destroy_user_session
  end
  root to: 'home#index'
end
