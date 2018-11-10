require 'rails_helper'

RSpec.describe "game_sessions/index", type: :view do
  before(:each) do
    assign(:game_sessions, [
      GameSession.create!(),
      GameSession.create!()
    ])
  end

  it "renders a list of game_sessions" do
    render
  end
end
