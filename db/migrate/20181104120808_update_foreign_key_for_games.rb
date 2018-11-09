# frozen_string_literal: true

class UpdateForeignKeyForGames < ActiveRecord::Migration[5.2]
  def change
    remove_reference :games, :game_master
    add_reference :games, :game_master, foreign_key: { to_table: :users }, on_delete: :cascade
  end
end
