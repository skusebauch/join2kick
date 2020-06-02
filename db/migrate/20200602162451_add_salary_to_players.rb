class AddSalaryToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :salary, :integer
  end
end
