class CreateMaintenances < ActiveRecord::Migration[5.0]
  def change
    create_table :maintenances do |t|
      t.datetime :date
      t.decimal :cost
      t.text :description
      t.datetime :warranty
      t.integer :mileage
      t.references :vehicle, foreign_key: true
      t.string :warranty_status
      t.string :type

      t.timestamps
    end
  end
end
