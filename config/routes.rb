Rails.application.routes.draw do
  devise_for :members, :path => "public/members"
  # devise_for :members, :controllers => {:passwords => 'public/members/passwords'}
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :public do
    get '' => 'members#show'
    get 'edit' => 'members#edit'
    patch '' => 'members#update'
    get 'leave' => 'members#leave'
    get 'cart_items' => 'cart_items#index'
    delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_public_cart_items'
    delete 'cart_items/:id' => 'cart_items#destroy_each',as: 'destroy_public_cart_item'
    get 'orders/thanks' => 'orders#thanks'
    post 'orders/confirm' => 'orders#confirm'
    resource :members, only:[:create]
    resources :items, except:[:destroy]
    resources :addresses
    resources :orders
    resources :cart_items, only: [:create, :update]
  end

  root 'public/homes#top'

  namespace :admin do
    get 'top' => 'admins#top'
    get 'items/new' => 'items#new'
    resources :items, except:[:new]
    resources :members
    resources :orders
    resources :genres
    resources :order_details, only: [:update]
  end

end
