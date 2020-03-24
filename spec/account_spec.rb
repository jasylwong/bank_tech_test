require 'spec_helper'

describe 'Account' do
  let(:account) { Account.new }
  let(:current_date) { Time.now.utc.strftime("%m/%d/%y") }

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
    it 'withdrawing 750 decreases balance by 750' do
      account.deposit(1000)
      account.withdraw(750)
      expect(account.balance).to eq(250)
    end

    it 'accepts multiple separate deposits' do
      account.deposit(530)
      account.deposit(25)
      expect(account.balance).to eq(555)
    end
  end

  context 'combinations' do
    it 'adjusts balance for a combination of deposits and withdrawals' do
      account.deposit(200)
      account.withdraw(169)
      expect(account.balance).to eq(31)
    end
  end

  describe '.transactions' do
    it 'shows transactions of deposits' do
      account.deposit(250)
      expect(account.transactions[0]).to be_a(Transaction)
      expect(account.transactions[0].type).to eq("deposit")
      expect(account.transactions[0].amount).to eq(250)
      expect(account.transactions[0].date).to eq(current_date)
    end

    it 'shows transactions of withdrawals' do
      account.withdraw(345)
      expect(account.transactions[0]).to be_a(Transaction)
      expect(account.transactions[0].type).to eq("withdrawal")
    end

    it 'shows combinations of withdrawals & deposits' do
      account.withdraw(690)
      account.deposit(235)
      expect(account.transactions[0].type).to eq("withdrawal")
      expect(account.transactions[1].type).to eq("deposit")
    end
  end
end
