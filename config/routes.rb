Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :competitions, only: [:new, :create]
  resources :estates
  resources :wines do
    resources :tastings do
      resources :tasting_aromas
    end
  end
  get "wine_to_taste" => "wines#wine_to_taste"
  get "wine_tasted" => "wines#wine_tasted"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
