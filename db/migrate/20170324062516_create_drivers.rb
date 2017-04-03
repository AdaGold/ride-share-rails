class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :vin
      t.string :car_make
      t.string :car_model

      t.timestamps
    end
  end
end
