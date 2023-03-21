require 'rails_helper'

feature 'User can view a list of available events', %q{
  In order to view all available events
  I'd like to be able to visit page with events list
} do

  given!(:events) { create_list(:event, 3) }

  scenario 'Use views a events list' do
    visit events_path

    expect(page).to have_content events[0].title
    expect(page).to have_content events[1].title
    expect(page).to have_content events[2].title
  end
end
