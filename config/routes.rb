SskjWebsite::Application.routes.draw do

  devise_for :users, :controllers => {sessions: 'users/sessions', registrations: 'users/registrations'}

  devise_scope :users do
    get '/users/sign_out' => 'users/sessions#destroy', :as => :destroy_user_session ,via:Devise.mappings[:user].sign_out_via
  end

  devise_for :admins , :controllers => {:registrations => 'admins/registrations', :sessions => 'admins/sessions'}

  devise_scope :admins do
    get '/admins/sign_out' => 'admins/sessions#destroy', :as => :destroy_admin_session ,via:Devise.mappings[:admin].sign_out_via
  end

 # match '/blogs/new', to: 'blogs#new', via: [:get, :post]
  match '/blogs', to: 'blogs#index', via: [:get]

  authenticated :admin do
 #   root to: 'admins#index'
  end

  get '/contact', to: 'contact#new'
  get '/projects', to: 'welcomes#projects'

  match 'auth/:provider/callback', to: 'facebook_sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'facebook_sessions#destroy', as: 'signout', via: [:get, :post]

  match  '/gsoc/proposal_ogdf', to: 'blogs#download', via: [:get]

 # get 'blogs/:blog', to: 'blogs#show', as: :blog
  resources :welcomes, :admins, :contact

  resources :blogs do
    resources :comments
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
   root :to => 'welcomes#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
