Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  get 'homes/top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
