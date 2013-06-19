class ChangeDecimalFieldsPrecision < ActiveRecord::Migration
  def change
    change_column :water_logs,  :volume, :integer
    change_column :weight_logs, :weight, :decimal, precision: 9, scale: 4

    change_column :food_logs, :carbs,   :decimal, precision: 9, scale: 4
    change_column :food_logs, :fat,     :decimal, precision: 9, scale: 4
    change_column :food_logs, :protein, :decimal, precision: 9, scale: 4

    change_column :recipes, :servings, :decimal, precision: 9, scale: 4

    change_column :foods, :carbs,    :decimal, precision: 9, scale: 4
    change_column :foods, :fat,      :decimal, precision: 9, scale: 4
    change_column :foods, :protein,  :decimal, precision: 9, scale: 4
    change_column :foods, :servings, :decimal, precision: 9, scale: 4

    change_column :users, :start_weight,   :decimal, precision: 9, scale: 4
    change_column :users, :goal_weight,    :decimal, precision: 9, scale: 4
    change_column :users, :current_weight, :decimal, precision: 9, scale: 4
  end
end
