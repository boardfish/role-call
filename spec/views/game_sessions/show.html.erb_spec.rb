require 'rails_helper'

RSpec.describe "game_sessions/show", type: :view do
  before(:each) do
    @game_session = assign(:game_session, GameSession.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
