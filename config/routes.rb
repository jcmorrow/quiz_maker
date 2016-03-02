Rails.application.routes.draw do
  
  devise_for :users
  root 'quizzes#index'

  resources :quizzes, only: [:new, :create, :index, :edit, :show] do
    resources :outcomes, only: [:new, :create]
    resources :questions, only: [:new, :create]
  end
  resources :questions, only: [:edit, :show] do
    resources :choices, only: [:new, :create]
    resources :answers, only: [:new, :create]
  end
  resources :choices, only: [:edit] do
    resources :weights, only: [:new, :create]
  end
  resources :outcomes, only: [:edit]  

end
