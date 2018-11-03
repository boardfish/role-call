class CreateGameSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :game_sessions do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.references :role, foreign_key: true
      t.integer :state

      t.timestamps
    end
  end
end
