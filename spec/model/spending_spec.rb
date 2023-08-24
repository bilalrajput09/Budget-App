require 'rails_helper'

RSpec.describe Spending, type: :model do
  let(:user) { User.new(name: 'Bilal Ahmed', email: 'bilal@gmail.com', password: 'password') }

  before do
    user.save
  end

  it 'is valid with valid properties and verify the assosiations' do
    spending = Spending.new(name: 'Mango', amount: 10)
    user.spendings << spending
    expect(spending.valid?).to eq(true)
  end

  it 'is invalid with invalid properties' do
    spending = Spending.new(amount: 10)
    user.spendings << spending
    expect(spending.valid?).to eq(false)
  end
end
