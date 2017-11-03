class AddProductIdToTrendingProducts < ActiveRecord::Migration
  def change
    add_column :spree_trending_products, :product_id, :integer
  end
end
