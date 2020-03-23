# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Public Website', type: :system do
  before do
    driven_by(:selenium_headless)
  end

  let!(:opening) { Fabricate(:opening) }

  it 'displays offers' do
    visit root_path
    expect(page).to have_content('Active openings')
    expect(page).to have_content(opening.title)

    click_link 'View offer'
    expect(page).to have_content(opening.description)
    expect(page).to have_current_path(opening_path(opening))

    click_link 'Back to openings view'
    expect(page).to have_content('Active openings')
    expect(page).to have_current_path(openings_path)
  end
end
