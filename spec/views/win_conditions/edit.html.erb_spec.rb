# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'win_conditions/edit', type: :view do
  before(:each) do
    @win_condition = assign(:win_condition, WinCondition.create!(
                                              type: '',
                                              target: 1,
                                              must_be_lynched: false
                                            ))
  end

  it 'renders the edit win_condition form' do
    render

    assert_select 'form[action=?][method=?]', win_condition_path(@win_condition), 'post' do
      assert_select 'input[name=?]', 'win_condition[type]'

      assert_select 'input[name=?]', 'win_condition[target]'

      assert_select 'input[name=?]', 'win_condition[must_be_lynched]'
    end
  end
end
