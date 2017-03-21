Rails.application.routes.draw do
  resources :groups do
    resources :events
    resources :invitations
    resources :comments
    resources :images
  end

  resources :events do
    resources :comments
    resources :rsvps, only: [:new, :create, :destroy, :edit, :update]
  end

  resources :sessions, except: [:index]


  resources :polls

  resources :answers, only: [:create]

  resources :users, except: [:index, :destroy] do
    resources :memberships
  end

  resources :events do
    resources :comments
  end

  get '/groups/:id/invitations' => 'invitations#index', as: '_invitations'

  root 'memberships#index'
end
