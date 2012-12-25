TelaKKi::Application.routes.draw do
  resources :cities
  resources :images
  resources :categories

    resources :messages, only: [:create, :index, :show]

    devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" } do
    #  get '/profile' => 'users/registrations#edit', as: :edit_user_registration
      get "/profile", :to => "devise/registrations#edit", :as => :user_profile
      get "/my_items" => "items#for_user"
      get "/messages" => "messages#index"
    end

    resources :items


    match "/solution" => "pages#solution"
    match "/faq" => "pages#faq"
    match "/help" => "pages#help"
    match "/about_us" => "pages#about_us"

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
  match "/prelauncher", to: "pages#prelauncher", via: "post"
#  match "/intro", to: "pages#intro"
  match "/like", to: "items#like"
  match "/dislike", to: "items#dislike"

  root :to => 'categories#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
