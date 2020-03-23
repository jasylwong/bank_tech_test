require 'spec_helper'

describe 'Transaction' do
  let(:current_date) { Time.now.strftime("%m/%d/%y") }
  let(:transaction) { Transaction.new("deposit", 500) }

  it 'allows creation of a deposit transaction' do
    expect(transaction.instance_of? Transaction).to eq(true)
  end

  describe '.type' do
    it 'returns the type' do

      expect(transaction.type).to eq("deposit")
    end
  end

  describe '.date' do
    it 'returns the date' do

      expect(transaction.date).to eq(current_date)
    end
  end

  describe '.amount' do
    it 'returns the amount' do

      expect(transaction.amount).to eq(500)
    end
  end
end