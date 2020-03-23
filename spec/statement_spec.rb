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

    # context 'one deposit' do
    #   let(:account) { double :account, 
    #                 show_transactions: [[current_date,"deposit", "250.00"]]}

    #   let(:statement) { Statement.new(account) }
    #   it 'returns a one line statement following one deposit' do
    #     expect(statement.print)
    #       .to eq("date || credit || debit || balance\n#{current_date} || 250.00 || || 250.00")
    #   end
    # end

    # context 'one deposit' do
    #   let(:account) { double :account, 
    #                 show_transactions: []}

    #   let(:statement) { Statement.new(account) }
    #   it 'returns a blank statement when no transactions made' do
    #     expect(statement.print).to eq("date || credit || debit || balance")
    #   end
    # end
  end
end