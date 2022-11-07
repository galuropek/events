require 'rails_helper'

RSpec.describe Event, type: :model do
  # Rspec Example
  # it 'validates presence of name' do
  #   expect(Event.new(description: 'go to the cinema')).to_not be_valid
  # end
  #
  # it 'validates presence of description' do
  #   expect(Event.new(title: 'Cinema')).to_not be_valid
  # end

  # Shoulda-matchers Example
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
end
