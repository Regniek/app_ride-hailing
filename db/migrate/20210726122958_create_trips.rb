class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.references :rider, foreign_key: true, null:false
      t.references :driver, foreign_key: true, null:false
      t.datetime :initial_time
      t.datetime :finish_time
      t.decimal :initial_latitude
      t.decimal :initial_longitude
      t.decimal :finish_latitude
      t.decimal :finish_longitude
      t.decimal :fare
      t.boolean :fee_paid, default: false
    end
  end
end
