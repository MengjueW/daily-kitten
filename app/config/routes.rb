Rails.application.routes.draw do

  get "/sign_up_option", to: "pages#show", as: "show_page"
  get "/sign_in_option", to: "pages#signin", as: "sign_in_option"

  resources :pictures
  resources :cats do
    collection do
      get 'search'
      get 'present'
    end
    member do
      put "like", to: "cats#upvote"
      put "dislike", to: "cats#downvote"
    end
    resources :pictures, except: [:show, :index]
    resources :comments, except: [:index]
  end
  resources :comments
  devise_for :users
  devise_for :shelters
  resources :links do
    member do
      put "like", to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
    resources :comments
  end
  get '/dashboard', to: 'dashboard#show', as: "show_dashboard"
  get '/homepage', to: 'homepage#show', as: "show_homepage"
  get '/userdashboard', to: 'userdashboard#show', as: "show_userdashboard"
  
  resources :shelters
  authenticated :user do
    root :to => "cats#index", :as => :authenticated_user_root
  end
  authenticated :shelter do
    root :to => "dashboard#show", :as => :authenticated_shelter_root
  end
  root to: "pages#signin"
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
