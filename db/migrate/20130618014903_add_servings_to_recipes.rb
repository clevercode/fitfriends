class AddServingsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :servings, :decimal, precision: 5, scale: 2
  end
end
