require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_least(4) }
  it { should validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_least(4) }
end
