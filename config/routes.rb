TelaKKi::Application.routes.draw do

  if Rails.env.development?

  resources :messages

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config


  devise_for :users do
  #  get '/profile' => 'users/registrations#edit', as: :edit_user_registration
    get "/profile", :to => "devise/registrations#edit", :as => :user_profile
    get "/my_items" => "users#my_items"
    get "/my_messages" => "users#my_messages"
    get "/settings" => "users#settings"
  end

  resources :items


  match "/solution" => "pages#solution"
  match "/faq" => "pages#faq"
  match "/help" => "pages#help"
  match "/about_us" => "pages#about_us"


  end

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
  root :to => 'pages#solution'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
