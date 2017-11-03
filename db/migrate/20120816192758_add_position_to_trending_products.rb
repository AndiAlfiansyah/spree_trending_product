class AddPositionToTrendingProducts < ActiveRecord::Migration
  def change
    add_column :spree_trending_products, :position, :integer, :null => false, :default => 0
  end
end
