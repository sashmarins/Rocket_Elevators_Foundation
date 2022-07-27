class BuildingController < ApplicationController
    respond_to :json, :html
    def search
        @building_customer = Building.where(customer_id: params[:custselected])
        respond_with(@building_customer)
    end
end
