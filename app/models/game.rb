class Game < ApplicationRecord
  has_many :game_sessions
  has_many :users, through: :game_sessions
  belongs_to :game_master, class_name: 'User'
end
