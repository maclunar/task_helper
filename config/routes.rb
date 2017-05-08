Rails.application.routes.draw do
  root 'tasks#index'

  resources :tasks do
    resources :steps
  end
end
