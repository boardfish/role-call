# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'games/show', type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
                            user: nil,
                            game_master: nil
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
