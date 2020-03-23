# frozen_string_literal: true

RSpec.describe 'Admin website', type: :system do
  let!(:user) { Fabricate(:user) }
  let!(:opening) { Fabricate(:opening) }

  before do
    driven_by(:selenium_headless)
    login_as user, scope: :user
  end

  it 'displays offers' do
    visit admin_openings_path
    expect(page).to have_text(opening.title)

    click_link opening.title
    expect(page).to have_selector('.badge-success', text: 'Active')
    expect(page).to have_selector('button', text: 'Archive')
    expect(page).not_to have_selector('button', text: 'Publish')
  end
end
