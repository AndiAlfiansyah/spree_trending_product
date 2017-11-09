module Spree
  module Admin
    class CityChangesController < Spree::Admin::BaseController
      before_action :load_order, only: [:index]

      def index
        @city_changes = @order.city_changes.includes(:user).order(created_at: :desc)
      end

      private

      def load_order
        @order = Order.find_by!(number: params[:order_id])
        authorize! action, @order
      end
    end
  end
end
