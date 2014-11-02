class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :chi_name
      t.string :eng_name
      t.integer :type

      t.timestamps null: false
    end
  end
end
