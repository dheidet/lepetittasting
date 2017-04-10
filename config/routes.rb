Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # get 'wines/new'

  # get 'wines/create'

  # get 'wines/edit'

  # get 'wines/update'

  # get 'wines/destroy'

  root to: 'pages#home'

  resources :estates
  resources :wines do
    resources :tastings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
