module Spree
  module Admin
    class TrendingProductsController < ResourceController
      respond_to :html

      def index
        @trending_products = Spree::TrendingProduct.order(:position)
      end

      private

      def location_after_save
        if @trending_products.created_at == @trending_product.updated_at
          edit_admin_trending_product_url(@trending_product)
        else
          admin_trending_products_url
        end
      end

      def trending_product_params
        params.require(:trending_product).permit(:name, :body, :link_url, :published, :image, :position, :product_id)
      end
    end
  end
end
