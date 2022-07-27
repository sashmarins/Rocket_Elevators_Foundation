json.array!(@email_all_customers) do |customer|
    json.extract! customer, :email
end

json.array!(@building_customer) do |building|
    json.extract! building, :id, :address
end

json.array!(@battery_customer) do |battery|
    json.extract! battery, :id
end

json.array!(@column_customer) do |column|
    json.extract! column, :id
end

json.array!(@elevator_customer) do |elevator|
    json.extract! elevator, :id, :serial_number
end

json.array!(@employee_all) do |employee|
    json.extract! employee, :id, :name
end