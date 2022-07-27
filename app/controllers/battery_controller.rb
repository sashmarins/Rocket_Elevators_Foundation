class BatteryController < ApplicationController
    respond_to :json, :html
    def search
        @battery_customer = Battery.where(building_id: params[:buildselected])
        respond_with(@battery_customer)
    end
end
