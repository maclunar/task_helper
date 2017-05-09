Rails.application.routes.draw do
  root 'tasks#index'

  resources :tasks do
    resources :steps
  end

  post 'steps/:step_id/unfinish', to: 'steps#unfinish'
  post 'steps/:step_id/finish', to: 'steps#finish'
end
