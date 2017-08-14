class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :model
      t.string :fabrication
      t.integer :mileage
      t.string :status
      t.string :numberplate
      t.string :slug

      t.timestamps
    end
  end
end
