Rails.application.routes.draw do
    devise_for :members, path: "public/members", controllers:{
    registrations: 'members/registrations',
    sessions: 'members/sessions',
    passwords: 'members/passwords'
}

  # devise_for :members, :controllers => {:passwords => 'public/members/passwords'}
  devise_for :admins, controllers:{
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
}

  namespace :public do
    get '' => 'members#show'
    get 'edit' => 'members#edit'
    patch '' => 'members#update'
    patch 'leave' => 'members#update_status'
    get 'leave' => 'members#leave'
    get 'cart_items' => 'cart_items#index'
    delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_public_cart_items'
    delete 'cart_items/:id' => 'cart_items#destroy_each',as: 'destroy_public_cart_item'
    get 'orders/thanks' => 'orders#thanks'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/member' => 'orders#member'
    resource :members, only:[:create]
    resources :items, except:[:destroy]
    resources :addresses
    resources :orders
    resources :cart_items, only: [:create, :update]
    resources :genres, only:[:show]
  end
  root 'public/homes#top'
  namespace :admin do
    get 'top' => 'admins#top'
    get 'items/new' => 'items#new'
    get 'members/:id/order' => 'orders#member', as: 'member_order'
    get 'orders/today' => 'orders#today'
    resources :items, except:[:new]
    resources :members
    resources :orders
    resources :genres
    resources :order_details, only: [:update]
  end
end
