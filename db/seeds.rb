# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

puts "seeding users"
user1 = User.create!(is_admin: true, email: 'mathieu.houde@codeboxx.biz', company_name: 'Codeboxx', encrypted_password: 'password123', password: 'password123', password_confirmation: 'password123') 
user2 = User.create!(is_admin: true, email: 'patrick.thibault@codeboxx.biz', company_name: 'Codeboxx', encrypted_password: 'password123', password: 'password123', password_confirmation: 'password123') 
user3 = User.create!(is_admin: true, email: 'francis.patry-jessop@codeboxx.biz', company_name: 'Codeboxx', encrypted_password: 'password123', password: 'password123', password_confirmation: 'password123') 
user4 = User.create!(is_admin: true, email: 'david.amyot@codeboxx.biz', company_name: 'Codeboxx', encrypted_password: 'password123', password: 'password123', password_confirmation: 'password123')
user5 = User.create!(is_admin: true, email: 'marie-eve.goupil@codeboxx.biz', company_name: 'Codeboxx', encrypted_password: 'password123', password: 'password123', password_confirmation: 'password123')
user6 = User.create!(is_admin: true, email: 'francois.boivin@codeboxx.biz', company_name: 'Codeboxx', encrypted_password: 'password123', password: 'password123', password_confirmation: 'password123')
user7 = User.create!(is_admin: true, email: 'timothy.wever@codeboxx.biz', company_name: 'Codeboxx', encrypted_password: 'password123', password: 'password123', password_confirmation: 'password123')
user8 = User.create!(is_admin: true, email: 'kiril.kleinerman@codeboxx.biz', company_name: 'Codeboxx', encrypted_password: 'password123', password: 'password123', password_confirmation: 'password123')
user9 = User.create!(is_admin: true, email: 'felicia.hartono@codeboxx.biz', company_name: 'Codeboxx', encrypted_password: 'password123', password: 'password123', password_confirmation: 'password123')
user10 = User.create!(is_admin: true, email: 'eileen.ai@codeboxx.biz', company_name: 'Codeboxx', encrypted_password: 'password123', password: 'password123', password_confirmation: 'password123')
puts "finished seeding users"
# employee1 = user1.Employee.create!(first_name: 'Mathieu', last_name: 'Houde', title: 'Gopher')
# employee2 = user2.Employee.create!(first_name: 'Patrick', last_name: 'Thibault', title: 'Maximalist')
# employee3 = user3.Employee.create!(first_name: 'Francis', last_name: 'Patry-Jessop', title: 'Captain')
# employee4 = user4.Employee.create!(first_name: 'David', last_name: 'Amyot', title: 'The Man')
# employee5 = user5.Employee.create!(first_name: 'Marie-Ève', last_name: 'Goupil', title: 'AI Master')
# employee6 = user6.Employee.create!(first_name: 'François', last_name: 'Boivin', title: 'The Tank')
# employee7 = user7.Employee.create!(first_name: 'Timothy', last_name: 'Wever', title: 'Beard Whisperer')
# employee8 = user8.Employee.create!(first_name: 'Kiril', last_name: 'Kleinerman', title: 'I <3 Winnipeg')
# employee9 = user9.Employee.create!(first_name: 'Felicia', last_name: 'Hartono', title: 'Scrums are too early')
# employee10 = user10.Employee.create!(first_name: 'Eileen', last_name: 'Ai', title: 'They really are.')

# def create_employee 
#     Employee.create!(employee_params)
# end

# private 
#     def employee_params
#         params.fetch( :employee, {})
#     end
puts "seeding employees"
Employee.create!(:user_id => user1.id, first_name: 'Mathieu', last_name: 'Houde', title: 'Gopher')
Employee.create!(:user_id => user2.id, first_name: 'Patrick', last_name: 'Thibault', title: 'Maximalist')
Employee.create!(:user_id => user3.id, first_name: 'Francis', last_name: 'Patry-Jessop', title: 'Captain')
Employee.create!(:user_id => user4.id, first_name: 'David', last_name: 'Amyot', title: 'The Man')
Employee.create!(:user_id => user5.id, first_name: 'Marie-Ève', last_name: 'Goupil', title: 'AI Master')
Employee.create!(:user_id => user6.id, first_name: 'François', last_name: 'Boivin', title: 'The Tank')
Employee.create!(:user_id => user7.id, first_name: 'Timothy', last_name: 'Wever', title: 'Beard Whisperer')
Employee.create!(:user_id => user8.id, first_name: 'Kiril', last_name: 'Kleinerman', title: 'I <3 Winnipeg')
Employee.create!(:user_id => user9.id, first_name: 'Felicia', last_name: 'Hartono', title: 'Scrums are too early')
Employee.create!(:user_id => user10.id, first_name: 'Eileen', last_name: 'Ai', title: 'They really are.')
puts "finshed seeding employees"
# User.delete_all

<<<<<<< HEAD
require_relative '../lib/populator_fix.rb'

Lead.populate 500 do |l|
    l.name = Faker::FunnyName.name
    l.company_name = Faker::Company.name
    l.email = Faker::Internet.email
    l.phone = Faker::PhoneNumber.cell_phone
    l.project_name = Faker::Book.title
    l.project_description = Faker::Marketing.buzzwords
    l.department = Faker::Job.field
    l.message = Faker::IndustrySegments.industry
    l.attachment =  Faker::Company.logo
    # date time created & updated
end

# Address.populate 500 do |a|
#     # address_type
#     # address status
#     #entity
#     a.address
# end

# Customers.populate 500 do |cu|
#     # user id
#     # address id
#     cu.company_name = Faker::Company.name
#     #adress
#     # customer created date
#     cu.contact_name = Faker::FunnyName.name

# end

Buildings.populate 500 do |bu|
    #customer id
    # Address of the building (In the address table)
    bu.building_admin_name = Faker::Name.name 
    bu.building_admin_email = Faker::Internet.free_email
    bu.building_admin_phone = Faker::PhoneNumber.cell_phone
    bu.building_tech_name = Faker::Name.name
    bu.building_tech_email = Faker::Internet.free_email
    bu.building_tech_phone = Faker::PhoneNumber.cell_phone
    # created_at
    # updated_at
    # customer_id index_buildings_on_customer_id
end

BuildingDetails.populate 500 do |bud|
    # bud.building_id
    # bud.created_at
    # bud.updated_at
    # index_batteries_on_building_id
end

Batteries.populate 500 do |ba|
    # ba.building_id
    # ba.building_type
    # battery_status
    # date_of_commission
    # last_inspection_date
    # operations_certificate
    ba.info = Faker::Quote.famous_last_words
    ba.notes = Faker::Quote.matz
    # created_at
    # updated_at
    # index_batteries_on_building_id
end

Columns.populate 500 do |co|
    # co.battery_id
    # number_of_floors_served
    # column_status
    co.info = Faker::Quote.famous_last_words
    co.notes = Faker::Quote.matz
    # created_at
    # updated_at
    # index_columns_on_battery_id
end

Elevators.populate 500 do |e|
    # e.column_id
    e.serial_number = Faker::IDNumber.chilean_id
    # elevator_model
    # elevator_status
    # elevator_commission_date
    # elevator_last_inspection_date
end



=======


e.type ["standard", "Premium", "Excelium"].sample(1)

def random_elevator_type
    elevator_type_random = rand(3)
    random_type_elevator = ""
    if elevator_type_random == 0 
        random_elevator_type = "Standard"
    elsif elevator_type_random == 1
        random_elevator_type = "Premium"
    elsif elevator_type_random == 2 
        random_elevator_type = "Excelium"
    end
    return random_type_elevator
end

def random_battery_status
    battery_status_random = rand(4)
    random_status_battery = ""
    if battery_status_random == 0
        random_status_battery = "Active"
    elsif battery_status_random == 1
        random_status_battery = "Inactive"
    elsif battery_status_random == 2
        random_status_battery = "Intervention"
    elsif battery_status_random == 3 
        random_status_battery = "Active"
    end
    return random_battery_status
end

def random_elevator_status
    elevator_status_random = rand(3)
    random_status_elevator = ""
    if elevator_status_random == 0
        random_status_elevator = "Idle"
    elsif elevator_status_random == 1
        random_status_elevator == "Stopped"
    elsif elevator_status_random == 2 
        random_status_elevator == "Moving"
    end
    return random_status_elevator
end

def random_building_type
    building_type_random = rand(4)
    random_type_building = ""
    if building_type_random == 0
        random_type_building = "Residential"
    elsif building_type_random == 1
        random_type_building = "Commercial"
    elsif building_type_random == 2 
        random_type_building = "Corporate"
    elsif building_type_random == 3 
        random_type_building = "Hybrid"
    end
    return random_type_building
end

def random_address_type
    address_type_random = rand(4)
    random_type_address = ""
    if address_type_random == 0
        random_type_address = "Business"
    elsif address_type_random == 1 
        random_type_address = "Billing"
    elsif address_type_random == 2
        random_type_address = "Shipping"
    elsif address_type_random == 3
        random_type_address = "Home"
    end
    return random_type_address
end

def random_address_status
    address_status_random = rand(2)
    random_status_address = ""
    if address_status_random == 0
        random_status_address = "Active"
    elsif address_status_random == 1
        random_status_address = "Inactive"
    end
    return random_status_address
end

def random_address_entity
    address_entity_random = rand(2)
    random_entity_address = ""
    if address_entity_random == 0
        random_entity_address = "Customer"
    elsif address_entity_random == 1
        random_entity_address = "Building"
    end
    return random_entity_address
end

def random_battery_certificate
    battery_certificate_random = rand(2)
    random_certificate_battery = ""
    if battery_certificate_random == 0
        random_certificate_battery = "Distributed"
    elsif battery_certificate_random == 1
        random_certificate_battery = "Pending"
    end
    return random_certificate_battery
end

def random_column_status
    column_status_random = rand(3)
    random_status_column = ""
    if column_status_random == 0
        random_status_column = "Online"
    elsif column_status_random == 1
        random_status_column = "Offline"
    elsif column_status_random == 2
        random_status_column = "In Maintenance"
    end
    return random_status_column
end


    
>>>>>>> main
