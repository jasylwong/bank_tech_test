require 'spec_helper'

describe 'Account' do
  let(:account) { Account.new }
  let(:current_date) { Time.now.strftime("%m/%d/%y") }

  # describe 'initialize' do
  #   it 'initializes with a balance of zero' do
  #     expect(account.balance).to eq 0
  #   end
  # end

  it 'allows opening of a new account' do
    expect(account.instance_of? Account).to eq(true)
  end

  describe '.deposit(amount)' do
    context 'confirmation message' do
      it 'provides a confirmation message when 500 deposited' do
        expect(account.deposit(500)).to eq("Deposit of 500 made. Balance: 500.")
      end

      it 'provides a confirmation message when 1000 deposited on top of 500' do
        account.deposit(500)
        expect(account.deposit(1000)).to eq("Deposit of 1000 made. Balance: 1500.")
      end
    end
  end

  describe '.withdraw(amount)' do
    context 'confirmation message' do
      it 'provides a confirmation message when 300 withdrawn' do
        account.deposit(500)
        expect(account.withdraw(300)).to eq("Withdrawal of 300 made. Balance: 200.")
      end

      it 'allows for overdrafts' do
        account.deposit(500)
        expect(account.withdraw(600)).to eq("Withdrawal of 600 made. Balance: -100.")
      end
    end
  end

  describe '.show_transactions' do
    it 'shows transactions of deposits' do
      account.deposit(250)
      expect(account.show_transactions).to eq([{:amount=>250, :date=>"03/23/20", :type=>"deposit"}])
    end

    it 'shows transactions of withdrawals' do
      account.withdraw(345)
      expect(account.show_transactions).to eq([{:amount=>345, :date=>"03/23/20", :type=>"withdrawal"}])
    end

    it 'shows combinations of withdrawals & deposits' do
      account.withdraw(690)
      account.deposit(235)
      expect(account.show_transactions).to eq([{:amount => 690, :date=>"03/23/20", :type=>"withdrawal"},
                                              {:amount=>235, :date=>"03/23/20", :type=>"deposit"}])
    end
  end
end

