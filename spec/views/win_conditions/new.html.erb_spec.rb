require 'rails_helper'

RSpec.describe "win_conditions/new", type: :view do
  before(:each) do
    assign(:win_condition, WinCondition.new(
      :type => "",
      :target => 1,
      :must_be_lynched => false
    ))
  end

  it "renders new win_condition form" do
    render

    assert_select "form[action=?][method=?]", win_conditions_path, "post" do

      assert_select "input[name=?]", "win_condition[type]"

      assert_select "input[name=?]", "win_condition[target]"

      assert_select "input[name=?]", "win_condition[must_be_lynched]"
    end
  end
end
