# frozen_string_literal: true

class WinCondition < ApplicationRecord
  enum target_type: {group: 'group', user: 'user'}, _prefix: :target_is
  enum target: {mafia: 'mafia', all: 'all', town: 'town'}, _prefix: :targets
end
