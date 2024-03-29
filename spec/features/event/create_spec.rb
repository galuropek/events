require 'rails_helper'

feature 'User can create new event', %q{
  In order to create new event
  I'd like to be able to create events
} do

  background do
    visit events_path
    click_on I18n.t 'events.index.new'
  end

  scenario 'User creates a new event' do
    fill_in Event.human_attribute_name(:title), with: 'New Event'
    fill_in Event.human_attribute_name(:description), with: 'New description'
    find('button.create-event').click

    expect(page).to have_content I18n.t 'events.create.success'
    expect(page).to have_content 'New Event'
    expect(page).to have_content 'New description'
  end

  scenario 'User creates a new event with invalid data' do
    fill_in Event.human_attribute_name(:title), with: 'New'
    fill_in Event.human_attribute_name(:description), with: ''
    find('button.create-event').click

    expect(page).to have_content invalid_attr(Event.human_attribute_name(:title), 'too_short.many', count: 4)
    expect(page).to have_content invalid_attr(Event.human_attribute_name(:description), 'blank')
    expect(page).to have_content invalid_attr(Event.human_attribute_name(:description), 'too_short.many', count: 4)
  end
end
