Rails.application.routes.draw do
  
  get 'homepages/index'
  devise_for :admin
  devise_scope :admin do
    authenticated :admin do
      root to: 'homepages#index', as: :authenticated_root
    end
    unauthenticated do
      root :to => 'admin/sessions#new', as: :unauthenticated_root
    end
  end
  #Dash board for all Models
  get '/admin' => 'pages#dashboard'
  #Restaurants 
  namespace :admin do
    resources :restaurants do
      resources :dishes
      resources :locations
    end 
  end 
  namespace :admin do
    resources :dishes do
      resources :ratings
    end  
  end  
  namespace :admin do
    #Restarants
    resources :restaurants
    #Dish categories
    resources :categories
    #Dishes
    resources :dishes
    #Locations
    resources :locations
    #Ratings
    resources :ratings
  end 
  #home page
  get '/search' => 'homepages#index', :as => 'home' 
  get '/dish/search' => 'homepages#search', :as => 'search_dish' 
  get '/dishes/:id' => 'homepages#show', :as => 'dishes_show' 
end
