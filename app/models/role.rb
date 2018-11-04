class Role < ApplicationRecord
  has_many :win_condition_associations, dependent: :destroy
  has_many :win_conditions, through: :win_condition_associations

  def target(game: nil, user: nil)
    self[:target] || GameSession.find_by(game: game, user: user)&.target
  end
end
