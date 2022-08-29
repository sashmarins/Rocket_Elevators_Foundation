class AddFkpointsToEmployees < ActiveRecord::Migration[5.2]
    def change
      change_table :employees do |t|
        t.json :facial_keypoints
      end
    end
end
