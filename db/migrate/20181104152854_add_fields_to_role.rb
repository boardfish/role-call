class AddFieldsToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :group, :string
    add_column :roles, :role_type, :string
    add_column :roles, :description, :string
    remove_column :roles, :rules
  end
end
