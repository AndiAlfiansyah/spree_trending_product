
class AddProductIdToTrendingProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_trending_products, :product_id, :integer
  end
end
