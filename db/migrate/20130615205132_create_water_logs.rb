class CreateWaterLogs < ActiveRecord::Migration
  def change
    create_table :water_logs do |t|
      t.integer :volume
      t.datetime :consumed_at
      t.integer :user_id

      t.timestamps
    end
  end
end
