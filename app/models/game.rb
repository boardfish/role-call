# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :game_sessions
  has_many :users, through: :game_sessions
  belongs_to :game_master, class_name: 'User'

  DEFAULT_QUOTAS = {
    "Town": {
      "Killing": 2,
      "Investigative": 2,
      "Protective": 1,
      "Support": 1,
      "Random": 3
    },
    "Mafia": {
      "Random": 2,
      "Godfather": 1,
      "Mafioso": 1
    },
    "Neutral": {
      "Evil": 1,
      "Killing": 1
    }
  }.deep_symbolize_keys



  def roles
    sorted_roles = game_sessions
      .map(&:role)
      .group_by(&:group).map do |group, roles|
      { "#{group}": roles.group_by(&:role_type) }
    end[0].deep_symbolize_keys
  end

  def available_roles
    DEFAULT_QUOTAS.deep_merge(roles) { |group, quota, count| quota - count.count}
  end
end
