Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  match 'visitando/:id', to: 'urls#visitando', via: 'get', as: 'visitlong'

  #get 'lala', to: 'urls#lala'

  root 'welcome#index'

  get 'login', to: 'users#login'

  post'ingresando', to: 'users#authenticate' 

  get 'ingresando', to: 'users#login'

  get 'users', to: 'users#new'

  get 'logout', to: 'users#logout'

  resources :users , except: :index


  resources :urls, only: [:new, :create, :show, :destroy]

  

  # Match es para rutas muy especificas que pueden utilizar varios metodos
  # Ejemplo login get (Ingresa el usuario su informacion)
  # Login post autentifica
  # Por lo cual ambos tendrian el mismo nombre de controlador y accion users#login pero metodos distintos

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
