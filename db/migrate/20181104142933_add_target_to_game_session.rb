class AddTargetToGameSession < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :target, :integer
  end
end
