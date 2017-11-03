module Spree
  module Admin
    class TrendingProductsController < ResourceController
      respond_to :html

      def index
        @trending_products = Spree::TrendingProduct.order(:position)
      end

      private

      def location_after_save
          admin_trending_products_url
        end
      end

      def trending_product_params
        params.require(:trending_product).permit(:title, :body, :link_url, :published, :image, :position, :product_id)
      end
    end
  end
end
