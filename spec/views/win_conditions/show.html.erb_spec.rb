require 'rails_helper'

RSpec.describe "win_conditions/show", type: :view do
  before(:each) do
    @win_condition = assign(:win_condition, WinCondition.create!(
      :type => "Type",
      :target => 2,
      :must_be_lynched => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
