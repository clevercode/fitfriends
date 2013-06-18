class AddAmountAndServingsToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :amount, :string
    add_column :foods, :servings, :decimal, precision: 5, scale: 2
  end
end
