# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            phone_number: 'Phone Number',
                            nickname: 'Nickname'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Nickname/)
  end
end
