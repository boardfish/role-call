class ChangeWinConditionAttributesToBeIntegers < ActiveRecord::Migration[5.2]
  def up
    change_column :win_conditions, :target, 'integer USING CAST(target AS integer)'
    change_column :win_conditions, :target_type, 'integer USING CAST(target_type AS integer)'
  end

  def down
    change_column :win_conditions, :target, :string
    change_column :win_conditions, :target_type, :string
  end
end
