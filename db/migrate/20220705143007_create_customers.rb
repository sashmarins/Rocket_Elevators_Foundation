class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :user, foreign_key: true
      t.string :company_name
      t.integer :number_of_elevators
      t.string :customer_created_date
      t.string :contact_name
      t.string :phone_number
      t.string :email
      t.text :company_description 
      t.string :service_tech_name
      t.integer :service_tech_phone
      t.string :service_tech_email
      t.timestamps
    end
  end
end
