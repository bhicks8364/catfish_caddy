# == Route Map
#
#                         Prefix Verb   URI Pattern                                               Controller#Action
#                     main_index GET    /main/index(.:format)                                     main#index
# returned_tournament_fish_index GET    /tournaments/:tournament_id/fish/returned(.:format)       fish#returned
# stringer_tournament_fish_index GET    /tournaments/:tournament_id/fish/stringer(.:format)       fish#stringer
#     throw_back_tournament_fish PATCH  /tournaments/:tournament_id/fish/:id/throw_back(.:format) fish#throw_back
#          tournament_fish_index GET    /tournaments/:tournament_id/fish(.:format)                fish#index
#                                POST   /tournaments/:tournament_id/fish(.:format)                fish#create
#            new_tournament_fish GET    /tournaments/:tournament_id/fish/new(.:format)            fish#new
#           edit_tournament_fish GET    /tournaments/:tournament_id/fish/:id/edit(.:format)       fish#edit
#                tournament_fish GET    /tournaments/:tournament_id/fish/:id(.:format)            fish#show
#                                PATCH  /tournaments/:tournament_id/fish/:id(.:format)            fish#update
#                                PUT    /tournaments/:tournament_id/fish/:id(.:format)            fish#update
#                                DELETE /tournaments/:tournament_id/fish/:id(.:format)            fish#destroy
#                    tournaments GET    /tournaments(.:format)                                    tournaments#index
#                                POST   /tournaments(.:format)                                    tournaments#create
#                 new_tournament GET    /tournaments/new(.:format)                                tournaments#new
#                edit_tournament GET    /tournaments/:id/edit(.:format)                           tournaments#edit
#                     tournament GET    /tournaments/:id(.:format)                                tournaments#show
#                                PATCH  /tournaments/:id(.:format)                                tournaments#update
#                                PUT    /tournaments/:id(.:format)                                tournaments#update
#                                DELETE /tournaments/:id(.:format)                                tournaments#destroy
#                     fish_index GET    /fish(.:format)                                           fish#index
#                                POST   /fish(.:format)                                           fish#create
#                       new_fish GET    /fish/new(.:format)                                       fish#new
#                      edit_fish GET    /fish/:id/edit(.:format)                                  fish#edit
#                           fish GET    /fish/:id(.:format)                                       fish#show
#                                PATCH  /fish/:id(.:format)                                       fish#update
#                                PUT    /fish/:id(.:format)                                       fish#update
#                                DELETE /fish/:id(.:format)                                       fish#destroy
#                         colors GET    /colors(.:format)                                         colors#index
#                                POST   /colors(.:format)                                         colors#create
#                      new_color GET    /colors/new(.:format)                                     colors#new
#                     edit_color GET    /colors/:id/edit(.:format)                                colors#edit
#                          color GET    /colors/:id(.:format)                                     colors#show
#                                PATCH  /colors/:id(.:format)                                     colors#update
#                                PUT    /colors/:id(.:format)                                     colors#update
#                                DELETE /colors/:id(.:format)                                     colors#destroy
#                           root GET    /                                                         main#index
#

Rails.application.routes.draw do
  resources :tweets
  # get 'members/index'
  
  # get 'members/:id'

  resources :teams
  devise_for :members
  resources :members
  get 'main/index'

  resources :tournaments do
    resources :fish do
      collection do 
        get :returned
        get :stringer
      end
      member do
        patch :throw_back
      end
    end
  end
  resources :fish
  resources :colors
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'

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
