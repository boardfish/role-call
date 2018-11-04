class CreateWinConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :win_conditions do |t|
      t.string :target_type
      t.integer :target
      t.boolean :must_be_lynched

      t.timestamps
    end
  end
end
