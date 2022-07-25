class InterventionController < ApplicationController
    def index
        @intervention = Intervention.all
    end

    def show
        @intervention = Intervention.find(params[:id])
    end

    def new
        @intervention = Intervention.new
    end

    def create
        @intervention = Intervention.new(intervention_params)

        @intervention.author = current_user.email
        @intervention.customer_id = #find customer id for the email selected and put it here
        @intervention.building_id = params["customer-building"]
        @intervention.battery_id = params["customer-battery"]
        @intervention.column_id = params["customer-column"]
        @intervention.elevator_id = params["customer-elevator"]
        @intervention.employee_id = params["customer-employee"]
        @intervention.intervention_started = nil
        @intervention.intervention_ended = nil
        @intervention.result = "Incomplete"
        @intervention.report = params["intervention-description"]
        @intervention.status = "Pending"

        @intervention.save!
        if @intervention.save
            redirect_back fallback_location: root_path, notice: "Your contact request has been sent successfully!"
        end
        
        # Freshdesk
    end

    private
    def intervention_params
        params.fetch(:intervention, {})
    end
    
end
