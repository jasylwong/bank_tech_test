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
    it 'depositing 50 increases balance by 50' do
      account.deposit(50)
      expect(account.balance).to eq(50)
    end

    it 'accepts multiple separate deposits' do
      account.deposit(530)
      account.deposit(25)
      expect(account.balance).to eq(555)
    end
  end

  describe '.withdraw(amount)' do
    # context 'confirmation message' do
    #   it 'provides a confirmation message when 300 withdrawn' do
    #     account.deposit(500)
    #     expect(account.withdraw(300)).to eq("Withdrawal of 300 made. Balance: 200.")
    #   end

    #   it 'allows for overdrafts' do
    #     account.deposit(500)
    #     expect(account.withdraw(600)).to eq("Withdrawal of 600 made. Balance: -100.")
    #   end
    # end
    it 'withdrawing 750 decreases balance by 750' do
      account.deposit(1000)
      account.withdraw(1000)
      expect(account.balance).to eq(50)
    end

    it 'accepts multiple separate deposits' do
      account.deposit(530)
      account.deposit(25)
      expect(account.balance).to eq(555)
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

