require 'account'

describe 'Account' do
  it 'allows opening of a new account' do
    account = Account.new()
    expect(account.instance_of? Account).to eq(true)
  end

  describe 'print_statement' do
    it 'prints blank statement before any transfers made' do
      account = Account.new()
      expect(account.print_statement).to eq('date || credit || debit || balance')
    end
  end
end
