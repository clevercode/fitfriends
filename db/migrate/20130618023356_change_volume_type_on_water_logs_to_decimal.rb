class ChangeVolumeTypeOnWaterLogsToDecimal < ActiveRecord::Migration
  def change
    change_column :water_logs, :volume, :decimal, precision: 5, scale: 2
  end
end
