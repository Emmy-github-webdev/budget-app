require 'rails_helper'

RSpec.describe Activity, type: :model do
  subject do
    Activity.new(
      name: 'Apple',
      amount: 10,
      user_id: 1
    )
  end

  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without icon' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'name is required' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'icon is required' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

end
