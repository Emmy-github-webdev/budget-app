require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John Doe',
      email: 'john.doee@example.com',
      password: 'passowrd'
    )
  end

  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'password is required' do
    subject.password = '12345678'
    expect(subject).to be_valid
  end

  it 'name is required' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email is required' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
