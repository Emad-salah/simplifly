Rails.application.routes.draw do

  resources :authentications, only: [:new, :create]
  resource :profile, only: [:show] do
    resource :subscription, only: [:show, :update, :destroy]
  end
end
