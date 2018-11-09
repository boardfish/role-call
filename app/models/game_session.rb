# frozen_string_literal: true

class GameSession < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :role

  STATE_MAPPINGS = %w[
    dead
    alive
  ].freeze

  def state(present = false)
    return STATE_MAPPINGS[@state] if present

    state
  end
end
