Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :trending_product
  end
end
