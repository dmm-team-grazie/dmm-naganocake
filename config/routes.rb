Rails.application.routes.draw do
  devise_for :members, :path => "public/members"
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :public do
    get '' => 'members#show'
    get 'edit' => 'members#edit'
    get 'leave' => 'members#leave'
    delete 'cart_items' => 'cart_items#destroy_all'
    delete 'cart_items/:id' => 'cart_items#destroy_each'
    get 'orders/thanks' => 'orders#thanks'
    post 'orders/confirm' => 'orders#confirm'
    resources :members, only:[:create, :update]
    resources :items, except:[:destroy]
    resources :addresses
    resources :orders
    resources :cart_items, only: [:index, :create, :update]
  end

  root 'homes#top'

  namespace :admin do
    get 'top' => 'admins#top'
    get 'items/:id/new' => 'items#new'
    resources :items, except:[:new]
    resources :members
    resources :orders
    resources :genres
    resources :order_details, only: [:update]
  end

end
