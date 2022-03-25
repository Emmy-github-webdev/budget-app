require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    Category.new(
      name: 'Apple',
      icon: 'http://www.image.com',
      user_id: 1
    )
  end

  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'name is required' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'icon is required' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
