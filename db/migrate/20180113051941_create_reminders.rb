class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.string :name
      t.datetime :date
      t.integer :mileage
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
