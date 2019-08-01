Rails.application.routes.draw do
  
  get 'homepages/index'
  devise_for :admins
  devise_scope :admin do
    authenticated :admin do
      root to: 'homepages#index', as: :authenticated_root
    end
    unauthenticated do
      root :to => 'admins/sessions#new', as: :unauthenticated_root
    end
  end
  #Dash board for all Models
  get '/dashboard' => 'pages#dashboard'
  #Restaurants 
  resources :restaurants do
    resources :dishes
    resources :locations
  end 
  resources :dishes do
    resources :ratings
  end  

  #Dish categories
  resources :categories
  #Dishes
  resources :dishes
  #Locations
  resources :locations
  #Ratings
  resources :ratings
  #home page
  get '/search' => 'homepages#index', :as => 'home' 
  get '/dish/search' => 'homepages#search', :as => 'search_dish' 
  get '/dishes/:id' => 'homepages#show', :as => 'dishes_show' 
end
