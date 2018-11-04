require 'rails_helper'

RSpec.describe "win_condition_associations/show", type: :view do
  before(:each) do
    @win_condition_association = assign(:win_condition_association, WinConditionAssociation.create!(
      :win_condition => nil,
      :role => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
