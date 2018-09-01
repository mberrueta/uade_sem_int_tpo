require 'rails_helper'
require 'factory_bot'

RSpec.describe Organization, type: :model do

  subject { build(:organization) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without name' do
    expect(Organization.new.valid?).to be_falsey
  end
end
