class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :author, null: false
      t.integer :building_id, null: false
      t.integer :battery_id, null: false
      t.integer :column_id
      t.integer :elevator_id
      t.integer :employee_id
      t.datetime :intervention_started, default: nil
      t.datetime :intervention_ended, default: nil
      t.string :result, default: "Incomplete"
      t.text :report
      t.string :status, default: "Pending"

      t.timestamps
    end
  end
end
