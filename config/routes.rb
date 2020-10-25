Rails.application.routes.draw do  
  root to: "application#welcome"
  get 'recipes/public' => 'recipes#public'
  resources :recipes do
    resources :ingredients
    resources :comments
    resources :steps
  end
  resources :recipe_categories
  resources :categories
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
