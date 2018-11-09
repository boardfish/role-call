# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'win_condition_associations/new', type: :view do
  before(:each) do
    assign(:win_condition_association, WinConditionAssociation.new(
                                         win_condition: nil,
                                         role: nil
                                       ))
  end

  it 'renders new win_condition_association form' do
    render

    assert_select 'form[action=?][method=?]', win_condition_associations_path, 'post' do
      assert_select 'input[name=?]', 'win_condition_association[win_condition_id]'

      assert_select 'input[name=?]', 'win_condition_association[role_id]'
    end
  end
end
