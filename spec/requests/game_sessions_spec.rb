require 'rails_helper'

RSpec.describe "GameSessions", type: :request do
  describe "GET /game_sessions" do
    it "works! (now write some real specs)" do
      get game_sessions_path
      expect(response).to have_http_status(200)
    end
  end
end
