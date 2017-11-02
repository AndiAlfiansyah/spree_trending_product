module Spree
  module Admin
    class TrendingProductController < ResourceController
      respond_to :html

      def index
        @trending_product = Spree::TrendingProduct.order(:position)
      end

      private

      def trending_product_params
        params.require(:trending_product).permit(:name, :body, :link_url, :published, :image, :position, :product_id)
      end
    end
  end
end
