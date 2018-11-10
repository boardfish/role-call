require 'rails_helper'

RSpec.describe "game_sessions/edit", type: :view do
  before(:each) do
    @game_session = assign(:game_session, GameSession.create!())
  end

  it "renders the edit game_session form" do
    render

    assert_select "form[action=?][method=?]", game_session_path(@game_session), "post" do
    end
  end
end
