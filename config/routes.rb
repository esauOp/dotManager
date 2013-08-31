DotManager::Application.routes.draw do
  
  resources :products

  resources :categories

  get "teams/index"
  get "teams/show"
  get "teams/new"
  get "teams/edit"
  get "task_cats/index"
  get "task_cats/show"
  get "task_cats/new"
  get "task_cats/edit"

  get "clientes/index"
  get "clientes/show"
  get "clientes/new"
  get "clientes/create"
  get "clientes/edit"
  get "clientes/update"
  get "clientes/destroy"
  
  get "dashboard/index"

  
  resources :clientes
  resources :teams


  devise_for :usuarios do
    get "/logout", :to => "devise/sessions#destroy"
    # get "/raiz", :to => "devise/sessions#new"

  end

  #devise_for :usuarios
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'home#index'
  #root 'welcome#index'
  root 'dashboard#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
