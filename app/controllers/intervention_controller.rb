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

        sasha_freshdesk_domain = ENV["INTERVENTION_URL"]
        sasha_fresh_api_key =  ENV["INTERVENTION_FRESH_KEY"]
        x = "X"

        @intervention.customer_id = params["customer-email"]
        @intervention.building_id = params["customer-building"]
        @intervention.battery_id = params["customer-battery"]

        if params["customer-column"] == ""
            @intervention.column_id = nil
        else
            @intervention.column_id = params["customer-column"]
        end

        if params["customer-elevator"] == ""
            @intervention.elevator_id = nil
        else
            @intervention.elevator_id = params["customer-elevator"]
        end

        if params["customer-employee"] == ""
            @intervention.employee_id = nil
        else
            @intervention.employee_id = params["customer-employee"]
        end

        @intervention.intervention_started = nil
        @intervention.intervention_ended = nil
        @intervention.result = "Incomplete"
        @intervention.report = params["intervention-description"]
        @intervention.status = "Pending"

        if user_signed_in? && current_user.is_admin
            @intervention.author = current_user.id
            @intervention.save!
            if @intervention.save!
                redirect_back fallback_location: root_path, notice: "Your contact request has been sent successfully!"

                freshdesk_api_path = 'api/v2/tickets'
                sashadesk_api_url  = "https://davemustaine.freshdesk.com/#{freshdesk_api_path}"

                customer_email = Customer.find(params["customer-email"])
                author_name = Employee.find(current_user.id)
                if @intervention.employee_id != nil
                    employee_offloaded = Employee.find(params["customer-employee"])
                    offloaded_first_name = employee_offloaded[:first_name]
                    offloaded_last_name = employee_offloaded[:last_name]
                else
                    offloaded_first_name = "any"
                    offloaded_last_name = "employee"
                end
                author_first_name = author_name[:first_name]
                author_last_name = author_name[:last_name]
                

                if @intervention.column_id == nil
                    intervention_payload =  {
                        status: 2,
                        priority: 2,
                        type: "Feature Request",
                        email: customer_email[:email],
                        subject: "New Intervention Request from #{author_name[:first_name]} #{author_name[:last_name]} #{Time.now}",
                        description: "#{author_first_name} has requested that #{offloaded_first_name} #{offloaded_last_name} completes an intervention at <br/>
                        #{customer_email[:company_name]} building #{@intervention.building_id}, battery #{@intervention.battery_id}. The requester describes the intervention as #{@intervention.report}"
                    }
                elsif @intervention.column_id != nil && @intervention.elevator_id == nil
                    intervention_payload =  {
                        status: 2,
                        priority: 2,
                        type: "Feature Request",
                        email: customer_email[:email],
                        subject: "New Intervention Request from #{author_name[:first_name]} #{author_name[:last_name]} #{Time.now}",
                        description: "#{author_first_name} has requested that #{offloaded_first_name} #{offloaded_last_name} completes an intervention at <br/>
                        #{customer_email[:company_name]} building #{@intervention.building_id}, battery #{@intervention.battery_id}, column #{@intervention.column_id}. <br/>
                             The requester describes the intervention as #{@intervention.report}"
                    }
                else 
                    intervention_payload =  {
                    status: 2,
                    priority: 2,
                    type: "Feature Request",
                    email: customer_email[:email],
                    subject: "New Intervention Request from #{author_name[:first_name]} #{author_name[:last_name]} #{Time.now}",
                    description: "#{author_first_name} has requested that #{offloaded_first_name} #{offloaded_last_name} completes an intervention at <br/>
                    #{customer_email[:company_name]} building #{@intervention.building_id}, battery #{@intervention.battery_id}, column #{@intervention.column_id}, elevator #{@intervention.elevator_id} <br/>
                        The requester describes the intervention as #{@intervention.report}"
                }
                end

                site = RestClient::Resource.new(sashadesk_api_url, sasha_fresh_api_key, x)

                begin
                    response = site.post(intervention_payload.to_json, {content_type: :json, accept: :json})
                end
            end
        else
            redirect_back fallback_location: root_path, notice: "Only Employees are allowed to fill out this form!"
        end
        
    end

    private
    def intervention_params
        params.fetch(:intervention, {})
    end
    
end
