require 'rails_helper'

feature 'User can view a list of available rooms', %q{
  In order to view all available rooms
  I'd like to be able to visit page with rooms list
} do

  given!(:rooms) { create_list(:room, 3) }

  scenario 'User views a rooms list' do
    visit rooms_path

    expect(page).to have_content rooms[0].title
    expect(page).to have_content rooms[1].title
    expect(page).to have_content rooms[2].title
  end
end
