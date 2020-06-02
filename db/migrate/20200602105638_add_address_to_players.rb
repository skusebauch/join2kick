class AddAddressToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :address, :string
  end
end
