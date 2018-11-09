# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'win_condition_associations/index', type: :view do
  before(:each) do
    assign(:win_condition_associations, [
             WinConditionAssociation.create!(
               win_condition: nil,
               role: nil
             ),
             WinConditionAssociation.create!(
               win_condition: nil,
               role: nil
             )
           ])
  end

  it 'renders a list of win_condition_associations' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
