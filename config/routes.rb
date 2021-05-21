Rails.application.routes.draw do
  resources :customers, only: [:show,:edit,:update]
  
  resources :items, only: [:index,:show]
  
  resources :cart_items, only: [:create,:index,:update,:destroy] do
    collection do
      delete 'destroy_all'
    end
  end
  
  resources :addresses, only: [:index,:create,:edit,:destroy,:update]
  
  resources :orders, only: [:new,:create,:index,:show]
  get 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  
  
  namecpace :admin do
    get 'homes' => 'admin/homes#top'
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
    resources :genres, only: [:index,:create,:edit,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :orders, only: [:show,:update] do
      resources :oreder_items, only: [:update]
    end
  end
  
  get 'homes/top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
