FitFriends::Application.routes.draw do

  get  'sign-in',  to: 'sessions#new', as: 'sign_in'
  get  'sign-out', to: 'sessions#destroy', as: 'sign_out'

  get 'days/:date', to: 'days#index'
  get 'users/:user_id/days/:date', to: 'days#show'

  resources :sessions

  resources :users do
    resources :water_logs
    resources :weight_logs
    resources :food_logs
  end

  resources :recipes do
    resources :foods
  end

  root :to => 'users#index'
end
