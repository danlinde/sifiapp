Sifiapp::Application.routes.draw do

  root :to => "pages#index"

  devise_for :organizers, path_names: {sign_in: "login", sign_out: "logout"},

    controllers: {omniauth_callbacks: "authentications"}
    #, registrations: "registrations"}
    #With this line, we are telling our app to use the authentications controller instead of devise
    #to handle our omniauth_callbacks, 

  devise_scope :organizer do
    get 'organizers/:id' => 'organizers#show', as: 'organizer'
  end
  
  resources :events do
    resources :participants
    resources :charges
  end

  get '/events/:id/:token' => "events#show", as: "participant_token"

  get '/authentications/get_email' => 'authentications#get_email'
  patch '/authentications/set_email' => 'authentications#set_email'



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
