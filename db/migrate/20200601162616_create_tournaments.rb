class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :state
      t.string :season_year
      t.string :tournament_type
      t.string :league

      t.timestamps
    end
  end
end
