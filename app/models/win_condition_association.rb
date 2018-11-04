class WinConditionAssociation < ApplicationRecord
  belongs_to :win_condition
  belongs_to :role
end
