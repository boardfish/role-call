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
      # Stage 1: delete all roles that aren't available
      .map do |group, role_types|
        [group, role_types.select { |_, quota| quota.positive? }]
      end.to_h
      # Stage 2: delete all groups that have no available role types
      .reject do |group, role_types|
        role_types.empty?
      end
  end

  def random_role
    group = available_roles.keys.shuffle.first
    role_type = available_roles[group].keys.shuffle.first
    Role.where(group: group, role_type: role_type).shuffle.first
    # How do we add a condition for unique roles?
  end
