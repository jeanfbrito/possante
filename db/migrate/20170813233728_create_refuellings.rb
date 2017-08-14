class CreateRefuellings < ActiveRecord::Migration[5.0]
  def change
    create_table :refuellings do |t|
      t.datetime :date
      t.integer :mileage
      t.decimal :liter_price
      t.float :liters
      t.string :gas_station
      t.integer :traveled_mileage
      t.decimal :total_value
      t.integer :result
      t.string :vehicle_id
      t.float :average_consumption

      t.timestamps
    end
  end
end
