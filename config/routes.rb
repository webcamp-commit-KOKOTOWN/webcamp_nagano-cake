Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  resources :customers, only: [:show,:edit,:update]
  get '/customer/:id/quit' => 'customers#quit', as: 'quit'
  patch '/customers/:id/out' => 'customers#out', as: 'customers_out'

  resources :items, only: [:index,:show]

  resources :cart_items, only: [:create,:index,:update,:destroy] do
    collection do
        delete '/' => 'cart_items#all_destroy'
      end
    end

  resources :addresses, only: [:index,:create,:edit,:destroy,:update]

  get 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  resources :orders, only: [:new,:create,:index,:show]

  namespace :admin do
    get 'homes' => 'admin/homes#top'
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
    resources :genres, only: [:index,:create,:edit,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :orders, only: [:index,:show,:update] do
      resources :order_items, only: [:update]
    end
  end

  root to: 'homes#top'
  get 'homes/top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
