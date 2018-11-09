# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_token :access_token
  has_many :game_sessions, dependent: :destroy
  has_many :games, through: :game_sessions, dependent: :destroy
end
