class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.decimal :start_weight, precision: 5, scale: 2
      t.decimal :goal_weight, precision: 5, scale: 2
      t.decimal :current_weight, precision: 5, scale: 2
      t.integer :height
      t.string :sex, limit: 1

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
