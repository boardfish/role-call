# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :game_sessions
  has_many :users, through: :game_sessions
  belongs_to :game_master, class_name: 'User'

  def roles
    game_sessions
      .map(&:role)
      .group_by(&:group).map do |group, roles|
      { "#{group}": roles.group_by(&:role_type) }
    end
  end
end
