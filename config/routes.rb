Rails.application.routes.draw do

  get 'wsdl_mtns/get_bill'

  root 'home#index'

  wash_out :wsdl_mtns

  ## Devoted
  get '/devoted/new' => 'devoteds#index', as: :new_devoted
  post '/devoted/create' => 'devoteds#create', as: :create_devoted
  get '/devoted/create' => 'devoteds#index'
  get '/devoted/show' => 'devoteds#show', as: :devoted
  get '/devoted/edit/:id' => 'devoteds#edit', as: :edit_devoted
  post '/devoted/update/:id' => 'devoteds#update', as: :update_devoted
  get '/devoted/update/:id' => 'devoteds#edit'
  get '/devoted/enable/:id' => 'devoteds#enable', as: :enable_devoted
  get '/devoted/disable/:id' => 'devoteds#disable', as: :disable_devoted

  ## Status List
  get '/status_list/new' => 'status_lists#index', as: :new_status_list
  post '/status_list/create' => 'status_lists#create', as: :create_status_list
  get '/status_list/create' => 'status_lists#index'
  get '/status_list/show' => 'status_lists#show', as: :status_list
  get '/status_list/edit/:id' => 'status_lists#edit', as: :edit_status_list
  post '/status_list/update/:id' => 'status_lists#update', as: :update_status_list
  get '/status_list/update/:id' => 'status_lists#edit'
  get '/status_list/enable/:id' => 'status_lists#enable', as: :enable_status_list
  get '/status_list/disable/:id' => 'status_lists#disable', as: :disable_status_list

  ## Marital status list
  get '/marital_status_list/new' => 'marital_status_list#index', as: :new_marital_status_list
  post '/marital_status_list/create' => 'marital_status_list#create', as: :create_marital_status_list
  get '/marital_status_list/create' => 'marital_status_list#index'
  get '/marital_status_list/show' => 'marital_status_list#show', as: :marital_status_list
  get '/marital_status_list/edit/:id' => 'marital_status_list#edit', as: :edit_marital_status_list
  post '/marital_status_list/update/:id' => 'marital_status_list#update', as: :update_marital_status_list
  get '/marital_status_list/update/:id' => 'marital_status_list#edit'
  get '/marital_status_list/enable/:id' => 'marital_status_list#enable', as: :enable_marital_status_list
  get '/marital_status_list/disable/:id' => 'marital_status_list#disable', as: :disable_marital_status_list

  ## Social Status List
  get '/social_status_list/new' => 'social_status_lists#index', as: :new_social_status_list
  post '/social_status_list/create' => 'social_status_lists#create', as: :create_social_status_list
  get '/social_status_list/create' => 'social_status_lists#index'
  get '/social_status_list/show' => 'social_status_lists#show', as: :social_status_list
  get '/social_status_list/edit/:id' => 'social_status_lists#edit', as: :edit_social_status_list
  post '/social_status_list/update/:id' => 'social_status_lists#update', as: :update_social_status_list
  get '/social_status_list/update/:id' => 'social_status_lists#edit'
  get '/social_status_list/enable/:id' => 'social_status_lists#enable', as: :enable_social_status_list
  get '/social_status_list/disable/:id' => 'social_status_lists#disable', as: :disable_social_status_list

  ## Tribe
  get '/tribe/new' => 'tribes#index', as: :new_tribe
  post '/tribe/create' => 'tribes#create', as: :create_tribe
  get '/tribe/create' => 'tribes#index'
  get '/tribe/show' => 'tribes#show', as: :tribe
  get '/tribe/edit/:id' => 'tribes#edit', as: :edit_tribe
  post '/tribe/update/:id' => 'tribes#update', as: :update_tribe
  get '/tribe/update/:id' => 'tribes#edit'
  get '/tribe/enable/:id' => 'tribes#enable', as: :enable_tribe
  get '/tribe/disable/:id' => 'tribes#disable', as: :disable_tribe

  ## Baptist responsibility
  get '/baptist_responsibility/new' => 'baptist_responsibilities#index', as: :new_baptist_responsibility
  post '/baptist_responsibility/create' => 'baptist_responsibilities#create', as: :create_baptist_responsibility
  get '/baptist_responsibility/create' => 'baptist_responsibilities#index'
  get '/baptist_responsibility/show' => 'baptist_responsibilities#show', as: :baptist_responsibility
  get '/baptist_responsibility/edit/:id' => 'baptist_responsibilities#edit', as: :edit_baptist_responsibility
  post '/baptist_responsibility/update/:id' => 'baptist_responsibilities#update', as: :update_baptist_responsibility
  get '/baptist_responsibility/update/:id' => 'baptist_responsibilities#edit'
  get '/baptist_responsibility/enable/:id' => 'baptist_responsibilities#enable', as: :enable_baptist_responsibility
  get '/baptist_responsibility/disable/:id' => 'baptist_responsibilities#disable', as: :disable_baptist_responsibility

  ## Fake path
  post '/baptism/create' => 'home#create_baptism', as: :create_baptism
  post '/married/create' => 'home#create_married', as: :create_married
  post '/student/create' => 'home#create_student', as: :create_student
  post '/employee/create' => 'home#create_employee', as: :create_employee
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
