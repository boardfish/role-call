class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :game_master, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
