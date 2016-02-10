Rails.application.routes.draw do
  devise_for :users, path: "u", path_names: { sign_in: 'login', sign_out: 'logout', confirmation: 'verification', sign_up: 'register' }
  match "choose_customer", controller: "home", action: "choose_customer", via: [:get]
  match "select_active_customer", controller: "home", action: "select_active_customer", via: [:get]
  match "customer_selected", controller: "home", action: "customer_selected", via: [:post]
  match "clear_customer", controller: "home", action:"clear_customer", via: [:get]
  resources :customers do
    resources :mappings
    resources :phone_numbers
  end
  devise_scope :user do
    match "sign_in", to: "devise/sessions#new", via: [:get]
  end

  namespace :json, path: 'json' do
    # Use this namespace for modals and other crap to get quick views
    resources :customers do
      resources :mappings
      resources :phone_numbers
    end
    resources :mappings do
      resources :phone_numbers
    end
    match 'get_applied_numbers', controller: "json_director", action: "get_applied_numbers", via: [:get]
  end
  root to: 'home#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  post 'messager', to: 'messager#incoming'
end
