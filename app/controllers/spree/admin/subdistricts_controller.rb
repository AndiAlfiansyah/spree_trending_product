module Spree
  module Admin
    class SubdistrictsController < ResourceController
      belongs_to 'spree/city'
      before_action :load_data

      def index
        respond_with(@collection) do |format|
          format.html
          format.js { render partial: 'subdistrict_list' }
        end
      end

      def collection
        puts params
        puts params[:city_id]
        if params[:subdistrict_id] != ''
          Spree::Subdistrict.order(:name).where(city_id: params[:subdistrict_id])
        end
      end

      def load_data
        @cities = City.order(:name)
      end
    end
  end
end
