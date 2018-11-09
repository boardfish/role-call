# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'win_condition_associations/edit', type: :view do
  before(:each) do
    @win_condition_association = assign(:win_condition_association, WinConditionAssociation.create!(
                                                                      win_condition: nil,
                                                                      role: nil
                                                                    ))
  end

  it 'renders the edit win_condition_association form' do
    render

    assert_select 'form[action=?][method=?]', win_condition_association_path(@win_condition_association), 'post' do
      assert_select 'input[name=?]', 'win_condition_association[win_condition_id]'

      assert_select 'input[name=?]', 'win_condition_association[role_id]'
    end
  end
end
