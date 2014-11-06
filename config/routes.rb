Rails.application.routes.draw do
  
  root 'application#index'
  
  scope :api, defaults: {format: :json} do
    match 'sign_in', to: 'application#sign_in', via: [:get]
    match 'sign_out', to: 'application#sign_out', via: [:get]
    match 'tickets/search', to: 'tickets#search_by_params', via: [:get]
    match 'ticket_requests/search', to: 'ticket_requests#search_by_ticket_id', via: [:get]
   
    resources :users
    resources :tickets
    resources :ticket_requests
    resources :roles
    resources :ticket_statuses
  end
  
  # For directly external success via absolute URL 
  get '/tickets/show' => 'tickets#show' 
  

  
  get '*patch' => 'application#index' 
end
