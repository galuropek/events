require 'rails_helper'

feature 'User can create new room', %q{
  In order to create new room
  I'd like to be able to create rooms
} do

  scenario 'User creates a new room' do
    visit new_room_path

    fill_in Room.human_attribute_name(:title), with: 'New Room'
    fill_in Room.human_attribute_name(:description), with: 'Desc'
    find('button.create-room').click

    expect(page).to have_content I18n.t 'rooms.create.success'
    expect(page).to have_content 'New Room'
    expect(page).to have_content 'Desc'
  end

  scenario 'User creates a new room with invalid data' do
    visit new_room_path

    fill_in Room.human_attribute_name(:title), with: 'New'
    find('button.create-room').click

    expect(page).to have_content invalid_attr(Room.human_attribute_name(:title), 'too_short.many', count: 4)
    expect(page).to have_content invalid_attr(Room.human_attribute_name(:description), 'blank')
    expect(page).to have_content invalid_attr(Room.human_attribute_name(:description), 'too_short.many', count: 4)
  end
end
