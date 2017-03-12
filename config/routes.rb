Rails.application.routes.draw do
  get 'tastings/index'

  get 'tastings/new'

  get 'tastings/create'

  get 'tastings/edit'

  get 'tastings/update'

  get 'tastings/destroy'

  devise_for :users
  root to: 'pages#home'

  resources :estates
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
