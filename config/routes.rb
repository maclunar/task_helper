Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'

  resources :tasks do
    resources :steps
  end

  resources :presets do
    resources :steps
  end

  post 'steps/:step_id/unfinish', to: 'steps#unfinish'
  post 'steps/:step_id/finish', to: 'steps#finish'
end
