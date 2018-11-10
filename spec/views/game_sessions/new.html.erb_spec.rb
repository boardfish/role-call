require 'rails_helper'

RSpec.describe "game_sessions/new", type: :view do
  before(:each) do
    assign(:game_session, GameSession.new())
  end

  it "renders new game_session form" do
    render

    assert_select "form[action=?][method=?]", game_sessions_path, "post" do
    end
  end
end
