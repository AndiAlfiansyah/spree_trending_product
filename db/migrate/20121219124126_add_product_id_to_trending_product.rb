class AddProductIdToSlides < ActiveRecord::Migration
  def change
    add_column :spree_trending_product, :product_id, :integer
  end
end
