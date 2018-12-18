Rails.application.routes.draw do
  root :to => 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
    resources :order_items
  end

  resources :products do
    resources :reviews
  end

  resource :cart, only: [:show]
end
