require 'spec_helper'

describe 'Statement' do
  let(:account) { double :account }
  let(:statement) { Statement.new(account) }
  let(:current_date) { Time.now.strftime("%m/%d/%y") }
  let(:deposit1) { double :transaction, date: current_date, type: "deposit", amount: 625.00}
  let(:withdrawal1) { double :transaction, date: current_date, type: "withdrawal", amount: 250.00}
  let(:withdrawal2) { double :transaction, date: current_date, type: "withdrawal", amount: 433.00}

  it 'allows creation of a new statement' do
    expect(statement.instance_of? Statement).to eq(true)
  end

  describe '.display' do
    context 'no transactions' do
      let(:account) { double :account, transactions: []}
      let(:statement) { Statement.new(account) }
      it 'returns a blank statement when no transactions made' do
        expect(statement.display).to eq("date || credit || debit || balance")
      end
    end

    context 'one deposit' do      
      let(:account) { double :account, transactions: [deposit1]}

      let(:statement) { Statement.new(account) }
      it 'returns a one line statement following one deposit' do
        expect(statement.display)
          .to eq("date || credit || debit || balance\n#{current_date} || 625.00 || || 625.00")
      end
    end

    context 'one withdrawal' do
      let(:account) { double :account, transactions: [withdrawal1]}

      let(:statement) { Statement.new(account) }
      it 'returns a one line statement following one deposit' do
        expect(statement.display)
          .to eq("date || credit || debit || balance\n#{current_date} || || 250.00 || -250.00")
      end
    end

    context 'multiple transactions' do
      let(:account) { double :account, transactions: [deposit1, withdrawal1]}

      let(:statement) { Statement.new(account) }
      it 'returns a one line statement following one deposit' do
        expect(statement.display)
          .to eq("date || credit || debit || balance"\
                 "\n#{current_date} || || 250.00 || 375.00"\
                 "\n#{current_date} || 625.00 || || 625.00")
      end
    end

    context 'multiple transactions, going into overdraft' do
      let(:account) { double :account, 
                    transactions: [deposit1, withdrawal1, withdrawal2]}

      let(:statement) { Statement.new(account) }
      it 'returns a one line statement following one deposit' do
        expect(statement.display)
          .to eq("date || credit || debit || balance"\
                 "\n#{current_date} || || 433.00 || -58.00"\
                 "\n#{current_date} || || 250.00 || 375.00"\
                 "\n#{current_date} || 625.00 || || 625.00")
      end
    end
  end
end
