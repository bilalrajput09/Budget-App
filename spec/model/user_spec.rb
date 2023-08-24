require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid properties' do
    user = User.new(name: 'Bilal Ahmed', email: 'bilal@gmail.com', password: 'password')

    expect(user.valid?).to eq(true)
  end

  it 'should not be valid with invalid properties' do
    user = User.new(password: 'Password', email: 'bilal@gmail.com')
    expect(user.valid?).to eq(false)
  end
end
