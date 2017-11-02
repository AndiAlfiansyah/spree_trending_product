Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :trending_product do
      collection do
        post :update_positions
      end
    end
  end
end
