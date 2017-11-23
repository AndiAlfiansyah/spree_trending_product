module Spree
  class CitiesController < ActionController::Base
    def index
      @cities = Spree::City.order(:name)
      @cities = @cities.where(state_id: params[:parent_id]) if params[:parent_id]
    end
  end
end
