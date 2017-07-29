Rails.application.routes.draw do
  resources :replies,only:[:create,:edit,:update,:destroy]
  resources :comments,only:[:create,:edit,:update,:destroy]
  resources :answers,only:[:create,:edit,:update,:destroy]
  resources :questions,only:[:create,:edit,:update,:destroy]
  get 'home/index'
  root 'home#index'
  get '/profile' =>'home#profile'
  get '/users' =>'home#users'
  post'/upload'=> 'home#profile_picture'
  post '/upvoteToggle' => 'upvoteqs#upvoteToggle'
  post '/downvoteToggle' => 'downvoteqs#downvoteToggle'
  post '/upvoteToggleAnswer' => 'upvoteas#upvoteToggleAnswer'
  post '/downvoteToggleAnswer' => 'downvoteas#downvoteToggleAnswer'
  post '/upvoteToggleComment' => 'upvotecs#upvoteToggleComment'
  post '/downvoteToggleComment' => 'downvotecs#downvoteToggleComment'
  post '/upvoteToggleReply' => 'upvoters#upvoteToggleReply'
  post '/downvoteToggleReply' => 'downvoters#downvoteToggleReply'
  post '/follow' => 'home#follow'
  devise_for :users
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
