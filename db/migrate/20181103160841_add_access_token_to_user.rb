# frozen_string_literal: true

class AddAccessTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :access_token, :string
    add_column :users, :last_generated_at, :datetime
  end
end
