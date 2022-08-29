class AddFacialKeypointsToEmployees < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.json :facial_keypoints
    end
  end
end
