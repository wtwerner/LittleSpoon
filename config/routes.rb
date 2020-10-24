Rails.application.routes.draw do
  root to: "application#welcome"
  resources :steps
  resources :recipes do
    resources :ingredients
  end
  resources :categories
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
