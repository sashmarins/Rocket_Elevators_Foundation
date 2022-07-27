class EmployeeController < ApplicationController
    respond_to :json, :html
    def search
        @employee_all = Employee.all
        respond_with(@employee_all)
    end
end
