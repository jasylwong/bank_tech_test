require 'spec_helper'

describe 'Statement' do
  let(:account) { double :account }
  let(:subject) { Statement.new(account) }
  let(:current_date) { Time.now.utc.strftime("%m/%d/%y") }
  let(:deposit1) { double :transaction, date: current_date, type: "deposit", amount: 1000.00 }
  let(:deposit2) { double :transaction, date: current_date, type: "deposit", amount: 2000.00 }
  let(:withdrawal1) { double :transaction, date: current_date, type: "withdrawal", amount: 500.00 }

  it 'allows creation of a new statement' do
    expect(subject.instance_of? Statement).to eq(true)
  end

  describe '.display' do
    context 'no transactions' do
      let(:account) { double :account, transactions: [] }
      let(:subject) { Statement.new(account) }
      it 'returns a blank statement when no transactions made' do
        expect(subject.display).to eq("date || credit || debit || balance")
      end
    end

    context 'one deposit' do      
      let(:account) { double :account, transactions: [deposit1] }

      let(:subject) { Statement.new(account) }
      it 'returns a one line statement following one deposit' do
        expect(subject.display)
          .to eq("date || credit || debit || balance\n#{current_date} || 1000.00 || || 1000.00")
      end
    end

    context 'one withdrawal' do
      let(:account) { double :account, transactions: [withdrawal1] }

      let(:subject) { Statement.new(account) }
      it 'returns a one line statement following one deposit' do
        expect(subject.display)
          .to eq("date || credit || debit || balance\n#{current_date} || || 500.00 || -500.00")
      end
    end

    context 'combination of transactions' do
      let(:account) { double :account, transactions: [deposit1, deposit2, withdrawal1] }

      let(:subject) { Statement.new(account) }
      it 'returns full statement following multiple transactions' do
        expect(subject.display)
          .to eq("date || credit || debit || balance"\
                 "\n#{current_date} || || 500.00 || 2500.00"\
                 "\n#{current_date} || 2000.00 || || 3000.00"\
                 "\n#{current_date} || 1000.00 || || 1000.00")
      end
    end
  end
end
