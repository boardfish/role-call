class GameSession < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :role

  STATE_MAPPINGS = [
    'dead',
    'alive'
  ]

  def state(present = false)
    return STATE_MAPPINGS[@state] if present
    state   
  end
end
