module Spree
  class SubdistrictsController < ActionController::Base
    def index
      @subdistricts = Spree::Subdistrict.order(:name)
      @subdistricts = @subdistricts.where(city_id: params[:parent_id]) if params[:parent_id]
    end
  end
end
