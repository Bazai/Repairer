Repairer::Application.routes.draw do

  get "estim/index"
  get "estim/showselects"
  get "maintenances/addpart"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "register" => "users#new", :as => "register"
  resources :users, :sessions, :admin
  
  # resources :brands do
  #     resources :car_models do
  #       resources :production_years do
  #         resources :issues
  #       end
  #     end
  #   end
  resources :brands, :car_models, :production_years, :maintenances, :parts, :labors
  get "estimator/index"
  post "estimator/index"
  get "estimator" => "estimator#index"
  # post "estimator" => "estimator#index"
  root :to => "users#new"




  get "modifications/index"
  get "modifications" => "modifications#index"

  post "modifications/add_brand"
  post "modifications/save_brand"
  get "modifications/new_brand"
  get "modifications/edit_brand"
  delete "modifications/remove_brand"

  post "modifications/add_car_model"
  post "modifications/save_car_model"
  get "modifications/new_car_model"
  get "modifications/edit_car_model"
  delete "modifications/remove_car_model"





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
  # match ':controller(/:action(/:id(.:format)))'
end
