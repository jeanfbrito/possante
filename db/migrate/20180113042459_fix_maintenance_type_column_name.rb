class FixMaintenanceTypeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :maintenances, :type, :maintenance_type
  end
end
