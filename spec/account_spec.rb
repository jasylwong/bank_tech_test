require 'account'

describe 'Account' do
  let(:account) { Account.new }

  # describe 'initialize' do
  #   it 'initializes with a balance of zero' do
  #     expect(account.balance).to eq 0
  #   end
  # end

  it 'allows opening of a new account' do
    expect(account.instance_of? Account).to eq(true)
  end

  describe 'print_statement' do
    it 'prints blank statement before any transfers made' do
      expect(account.print_statement).to eq('date || credit || debit || balance')
    end

    it 'prints statement after one deposit' do
      account.deposit(1000)
      expect(account.print_statement).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00")
    end
  end

  describe 'deposit' do
    context 'confirmation message' do
      it 'provides a confirmation message when 500 deposited' do
        expect(account.deposit(500)).to eq("Deposit of 500 made. Balance: #{500}.")
      end

      it 'provides a confirmation message when 1000 deposited on top of 500' do
        account.deposit(500)
        expect(account.deposit(1000)).to eq("Deposit of 1000 made. Balance: #{1500}.")
      end
    end
  end

  # describe 'withdraw' do
  #   context 'confirmation message' do
  #     it 'provides a confirmation message when 300 withdrawn' do

  #     end
  #   end
  # end
end
