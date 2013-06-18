class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :food_name
      t.decimal :carbs, precision: 5, scale: 2
      t.decimal :fat, precision: 5, scale: 2
      t.decimal :protein, precision: 5, scale: 2
      t.integer :recipe_id

      t.timestamps
    end
  end
end
