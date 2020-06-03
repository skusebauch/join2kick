class AddBudgetToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :budget, :integer
  end
end
