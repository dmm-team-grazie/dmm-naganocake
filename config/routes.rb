Rails.application.routes.draw do
  devise_for :members, :path => "public/members"
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :public do
    resources :members, only:[:create, :update]
    get '' => 'members#show'
    get 'edit' => 'members#edit'
    get 'leave' => 'members#leave'
    resources :items, except:[:destroy]
    delete 'cart_items' => 'cart_items#destroy_all'
    delete 'cart_items/:id' => 'cart_items#destroy_each'
    resources :addresses
    resources :orders
    get 'orders/thanks' => 'orders#thanks'
    post 'orders/confirm' => 'orders#confirm'


    root 'homes#top'
  end

  namespace :admins do
    resources :items, except:[:new]
    get 'items/:id/new' => 'items#new'
    resources :members
    resources :orders
    resources :genres
    resources :order_details, only: [:update]


    get 'top' => 'admins#top'
  end

end
