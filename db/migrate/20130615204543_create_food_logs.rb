class CreateFoodLogs < ActiveRecord::Migration
  def change
    create_table :food_logs do |t|
      t.string :food_name
      t.decimal :carbs, precision: 5, scale: 2
      t.decimal :fat, precision: 5, scale: 2
      t.decimal :protein, precision: 5, scale: 2
      t.datetime :consumed_at
      t.integer :user_id

      t.timestamps
    end
  end
end
