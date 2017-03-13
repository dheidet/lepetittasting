Rails.application.routes.draw do

  get 'wines/new'

  get 'wines/create'

  get 'wines/edit'

  get 'wines/update'

  get 'wines/destroy'

  devise_for :users
  root to: 'pages#home'

  resources :estates
  resources :tastings
  resources :wines
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
