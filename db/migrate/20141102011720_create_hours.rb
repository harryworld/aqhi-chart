class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.integer :district_id
      t.float :no2
      t.float :o3
      t.float :so2
      t.float :co
      t.float :pm10
      t.float :pm25

      t.timestamps null: false
    end
  end
end
