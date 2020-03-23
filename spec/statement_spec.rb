require 'spec_helper'

describe 'Statement' do
  let(:account) { double :account }
  let(:statement) { Statement.new(account) }
  let(:current_date) { Time.now.strftime("%m/%d/%y") }

  it 'allows creation of a new statement' do
    expect(statement.instance_of? Statement).to eq(true)
  end

  describe '.print' do
    context 'no transactions' do
      let(:account) { double :account, show_transactions: []}
      let(:statement) { Statement.new(account) }
      it 'returns a blank statement when no transactions made' do
        expect(statement.print).to eq("date || credit || debit || balance")
      end
    end

    context 'one deposit' do
      let(:account) { double :account, 
                    show_transactions: [{date: current_date, type: "deposit", amount: 250.00}]}

      let(:statement) { Statement.new(account) }
      it 'returns a one line statement following one deposit' do
        expect(statement.print)
          .to eq("date || credit || debit || balance\n#{current_date} || 250.00 || || 250.00")
      end
    end

    context 'one withdrawal' do
      let(:account) { double :account, 
                    show_transactions: [{date: current_date, type: "withdrawal", amount: 250.00}]}

      let(:statement) { Statement.new(account) }
      it 'returns a one line statement following one deposit' do
        expect(statement.print)
          .to eq("date || credit || debit || balance\n#{current_date} || || 250.00 || -250.00")
      end
    end

    context 'multiple transactions' do
      let(:account) { double :account, 
                    show_transactions: [{date: current_date, type: "deposit", amount: 643.00},
                                        {date: current_date, type: "withdrawal", amount: 123.00}]}

      let(:statement) { Statement.new(account) }
      it 'returns a one line statement following one deposit' do
        expect(statement.print)
          .to eq("date || credit || debit || balance"\
                 "\n#{current_date} || || 123.00 || 520.00"\
                 "\n#{current_date} || 643.00 || || 643.00")
      end
    end

    context 'multiple transactions, going into overdraft' do
      let(:account) { double :account, 
                    show_transactions: [{date: current_date, type: "deposit", amount: 643.00},
                                        {date: current_date, type: "withdrawal", amount: 123.00},
                                        {date: current_date, type: "withdrawal", amount: 750.00}]}

      let(:statement) { Statement.new(account) }
      it 'returns a one line statement following one deposit' do
        expect(statement.print)
          .to eq("date || credit || debit || balance"\
                 "\n#{current_date} || || 750.00 || -230.00"\
                 "\n#{current_date} || || 123.00 || 520.00"\
                 "\n#{current_date} || 643.00 || || 643.00")
      end
    end
  end
end