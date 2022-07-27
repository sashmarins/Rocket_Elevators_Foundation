class ElevatorController < ApplicationController
    respond_to :json, :html
    def search
        @elevator_customer = Elevator.where(column_id: params[:colselected])
        respond_with(@elevator_customer)
    end
end
