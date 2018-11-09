# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'WinConditionAssociations', type: :request do
  describe 'GET /win_condition_associations' do
    it 'works! (now write some real specs)' do
      get win_condition_associations_path
      expect(response).to have_http_status(200)
    end
  end
end
