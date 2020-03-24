require 'spec_helper'

describe 'Account' do
  let(:subject) { Account.new }
  let(:current_date) { Time.now.utc.strftime("%m/%d/%y") }

  it 'allows opening of a new account' do
    expect(subject.instance_of? Account).to eq(true)
  end

  describe '.deposit(amount)' do
    it 'depositing 50 increases balance by 50' do
      subject.deposit(50)
      expect(subject.balance).to eq(50)
    end

    it 'accepts multiple separate deposits' do
      subject.deposit(530)
      subject.deposit(25)
      expect(subject.balance).to eq(555)
    end
  end

  describe '.withdraw(amount)' do
    it 'withdrawing 750 decreases balance by 750' do
      subject.deposit(1000)
      subject.withdraw(750)
      expect(subject.balance).to eq(250)
    end

    it 'accepts multiple separate deposits' do
      subject.deposit(530)
      subject.deposit(25)
      expect(subject.balance).to eq(555)
    end
  end

  context 'combinations' do
    it 'adjusts balance for a combination of deposits and withdrawals' do
      subject.deposit(200)
      subject.withdraw(169)
      expect(subject.balance).to eq(31)
    end
  end

  describe '.transactions' do
    it 'shows transactions of deposits' do
      subject.deposit(250)
      expect(subject.transactions[0]).to be_a(Transaction)
      expect(subject.transactions[0].type).to eq("deposit")
      expect(subject.transactions[0].amount).to eq(250)
      expect(subject.transactions[0].date).to eq(current_date)
    end

    it 'shows transactions of withdrawals' do
      subject.withdraw(345)
      expect(subject.transactions[0]).to be_a(Transaction)
      expect(subject.transactions[0].type).to eq("withdrawal")
    end

    it 'shows combinations of withdrawals & deposits' do
      subject.withdraw(690)
      subject.deposit(235)
      expect(subject.transactions[0].type).to eq("withdrawal")
      expect(subject.transactions[1].type).to eq("deposit")
    end
  end
end
