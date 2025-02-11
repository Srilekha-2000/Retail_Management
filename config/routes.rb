Rails.application.routes.draw do
  # Devise routes with custom controllers
  devise_for :users, 
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'dashboard#index', as: :unauthenticated_root
    
  end

  resources :home
  resources :dashboard

resources :retailors do
  member do
    get :edit_visit      
    patch :update_visit  
  end

  collection do
    get :get_zones       
    get :by_zone         
  end
end

 namespace :dynamic_select do
  resources :zones
end
resources :add_users do
   get 'dynamic_select_zones', on: :collection
  end


  resources :roles, param: :name
 
  resources :orders do
  collection do
    get 'get_sizes'
     get :delivary_list
  end
  member do
    post :exit
    get :new_order 
    post :create_order
   
  end
end
resources :retailor_users do
  collection do
    get 'get_by_zone'
  end

  member do
    post 'assign_task' 
  end
end
resources :salesmans
 resources :catagories
 resources :shop_visits
 resources :products
  resources :zones
  resources :users do
  resources :user_zones, only: [:new, :create]
end
resources :retailor_visits do
  collection do
    get 'get_by_zone'
  end

  member do
    post 'assign_task' 
  end
end
resources :visits do
  collection do
     get :fetch_zones
     get :by_zone
  end
 end
end
