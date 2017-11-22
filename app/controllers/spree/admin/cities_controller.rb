module Spree
  module Admin
    class CitiesController < ResourceController
      belongs_to 'spree/state'
      before_action :load_data

      def index
        respond_with(@collection) do |format|
          format.html
          format.js { render partial: 'city_list' }
        end
      end

      def collection
        if params[:state_id] != ''
          Spree::City.order(:name).where(state_id: params[:state_id])
        end
      end

      def load_data
        @states = State.order(:name)
      end
    end
  end
end
