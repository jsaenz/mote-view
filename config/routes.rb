MoteView::Application.routes.draw do
  resources :motes

  resources :transforms

  resources :radios

  devise_for :users

  resources :sensors
  

  get "home/index"
  match "home" => "home#index", :as => :home
  match "home/setName" => "home#setName", :as => :setName
  match "home/setSensor" => "home#setSensor", :as => :setSensor
  match "home/setRadio" => "home#setRadio", :as => :setRadio
  match "home/setTransform" => "home#setTransform", :as => :setTransform 
  match "home/postMote" => "home#postMote", :as => :postMote   

  root :to => "home#index" 

  match "home/post_radio"     => "home#post_radio",     :as => :post_radio
  match "home/post_sensor"    => "home#post_sensor",    :as => :post_sensor 
  match "home/post_transform" => "home#post_transform", :as => :post_transform   

  match "admin" => "admin#index", :as => :admin
  
  match "motes/download/:id" => "motes#download", :as => :download

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
