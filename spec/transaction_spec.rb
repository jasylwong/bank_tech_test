require 'spec_helper'

describe 'Transaction' do
  let(:current_date) { Time.now.utc.strftime("%m/%d/%y") }
  let(:subject) { Transaction.new(type: "deposit", amount: 500) }

  it 'allows creation of a deposit transaction' do
    expect(subject.instance_of? Transaction).to eq(true)
  end

  describe '.type' do
    it 'returns the type' do
      expect(subject.type).to eq("deposit")
    end
  end

  describe '.date' do
    it 'returns the date' do
      expect(subject.date).to eq(current_date)
    end
  end

  describe '.amount' do
    it 'returns the amount' do
      expect(subject.amount).to eq(500)
    end
  end
end
