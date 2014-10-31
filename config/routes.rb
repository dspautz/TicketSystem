Rails.application.routes.draw do
  
  root 'application#index'
  
  scope :api, defaults: {format: :json} do
    match 'sign_in', to: 'application#sign_in', via: [:get]
    match 'sign_out', to: 'application#sign_out', via: [:get]
    match 'status_list', to: 'tickets#statuses', via: [:get]
    match 'tickets/search', to: 'tickets#search', via: [:get]
    match 'requests/search', to: 'requests#search_by_ticket_id', via: [:get]
    match 'users/search', to: 'users#search_by_user_id', via: [:get]
   
    resources :users
    resources :tickets
    resource :requests
  end
  
  get '/tickets/show' => 'tickets#show'  
        
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
end
