Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root '/public/home#top'
  get '/public/member/leave' => 'public/members#leave'
  get '/public/member/orders/thanks' => 'public/orders#thanks'
  get '/public/member/orders/confirm' => 'public/orders#confirm'
  get '/public/member/cart_items' => 'public/cart_items#destroy_all'
  get '/public/member/cart_items/:id' => 'public/cart_items#destroy_each'
  devise_for :users
​
  resources :admins do
    resource :genres,           only: [:index, :create, :edit, :update]
  end
​
  namespace :admin do
    resources :members do
      resource :items
      resource :order_details,  only: [:update]
      resource :orders,         only: [:index, :show, :update]
    end
  end
​
  namespace :public do
    resources :members do
      resource :addresses
      resource :orders
      resource :items,          only: [:index, :show]
      resource :cart_items,     only: [:index, :create, :update]
    end
  end
end
