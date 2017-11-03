class AddPositionToTrendingProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_trending_products, :position, :integer, :null => false, :default => 0
  end
end
