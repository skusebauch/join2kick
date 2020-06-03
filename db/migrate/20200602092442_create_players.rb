class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.date :birth
      t.string :citizenship
      t.integer :height
      t.references :user, null: false, foreign_key: true
      t.references :club, null: true, foreign_key: true
      t.float :longitude
      t.float :latitude
      t.string :position
      t.text :skill, array: true, default: []

      t.timestamps
    end
  end
end
