Rails.application.routes.draw do
  root to: "application#home"

  get '/login' => "sessions#new"
  get '/signup' => "trainers#new"

  resources :clients do
    resources :training_sessions, only: [:new, :index]
  end

  resources :trainers, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :training_sessions

  resources :sessions, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
