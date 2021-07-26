class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :number_plate
      t.string :vehicle_color
      t.string :brand
      t.string :phone
    end
  end
end
