require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, [
      Game.create!(
        :user => nil,
        :game_master => nil
      ),
      Game.create!(
        :user => nil,
        :game_master => nil
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
