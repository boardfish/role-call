# frozen_string_literal: true

class CreateWinConditionAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :win_condition_associations do |t|
      t.references :win_condition, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
