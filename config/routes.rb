Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :trending_products do
      collection do
        post :update_positions
      end
    end

    resources :states do
      resources :cities
    end

    resources :cities
  end
end
