# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               phone_number: 'Phone Number',
               nickname: 'Nickname'
             ),
             User.create!(
               phone_number: 'Phone Number',
               nickname: 'Nickname'
             )
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Phone Number'.to_s, count: 2
    assert_select 'tr>td', text: 'Nickname'.to_s, count: 2
  end
end
