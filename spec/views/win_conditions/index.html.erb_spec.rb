require 'rails_helper'

RSpec.describe "win_conditions/index", type: :view do
  before(:each) do
    assign(:win_conditions, [
      WinCondition.create!(
        :type => "Type",
        :target => 2,
        :must_be_lynched => false
      ),
      WinCondition.create!(
        :type => "Type",
        :target => 2,
        :must_be_lynched => false
      )
    ])
  end

  it "renders a list of win_conditions" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
