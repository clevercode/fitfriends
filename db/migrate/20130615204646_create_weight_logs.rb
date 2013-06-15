class CreateWeightLogs < ActiveRecord::Migration
  def change
    create_table :weight_logs do |t|
      t.decimal :weight, precision: 5, scale: 2
      t.datetime :measured_at
      t.integer :user_id

      t.timestamps
    end
  end
end
