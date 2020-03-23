require 'spec_helper'

describe 'Transaction' do
  it 'allows creation of a deposit transaction' do
    transaction = Transaction.new("deposit", 500)
    expect(transaction.instance_of? Transaction).to eq(true)
  end
end