Spree::Product.class_eval do
  has_one :trending_product, dependent: :destroy
  after_update :destroy_trending_product_if_deleted

  def destroy_trending_product_if_deleted
    trending_product.update_attributes(published: false) if trending_product && deleted_at
  end
end
