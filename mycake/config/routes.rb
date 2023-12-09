Rails.application.routes.draw do
  root to: "public/homes#top"
  get "/about" => "public/homes#about"
  
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  devise_for :customer, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  # get "/customers/my_page" => "public/customers#show", as: "my_page"
  # get "/customers/information/edit" => "public/customers#edit"
  # patch "/customers/information" => "public/customers#update"
  # get "/customers/unsubscribe" => "public/customers#unsubscribe"
  # patch "/customers/withdraw" => "public/customers#withdraw"
  scope :customers do
    get "/my_page" => "public/customers#show", as: "my_page"
    get "/information/edit" => "public/customers#edit"
    patch "/information" => "public/customers#update"
    get "/unsubscribe" => "public/customers#unsubscribe"
    patch "/withdraw" => "public/customers#withdraw"
  end
  
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  scope module: :public do
    resources :items, only: [:index, :show]
    
    get 'orders/complete' => 'orders#complete'
    post 'orders/confirm' => 'orders#confirm'
    resources :orders, only: [:create, :new, :index, :show]
    
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
  end
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  namespace :admin do
    get '/' => "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
