Devi::Application.routes.draw do
resources :users, only: [:index]

resources :activities

resources :stories do
 resources :comments, :tasks
  get :icebox, :current, :backlog, :done, on: :member
end

  resources :projects do
    resources :members, :stories
  end

  get "static_pages/home"
  get "static_pages/help"

  devise_for :users, controllers: {confirmations: 'confirmations', passwords: 'passwords', }
  devise_scope :user do
    get '/help' => 'static_pages#help', as: 'confirmation_getting_started'
  end

  root 'static_pages#help'
  match '/help', to: 'static_pages#help', via: 'get'
  get "projects/:id_project/members/:id/activate" => "members#activate", :as => "active_member"


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
