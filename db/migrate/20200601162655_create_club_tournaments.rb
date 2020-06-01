class CreateClubTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :club_tournaments do |t|
      t.references :club, null: false, foreign_key: true
      t.references :tournament, null: false, foreign_key: true

      t.timestamps
    end
  end
end
