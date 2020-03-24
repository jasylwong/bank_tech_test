require_relative '../../lib/transaction.rb'
require_relative '../../lib/account.rb'
require_relative '../../lib/statement.rb'

transaction = Transaction.new(type: 'deposit', amount: 500)
p "New transaction: #{transaction}"

p "----------" 
account = Account.new()
p "New account: #{account}"
p account.deposit(1000)
p account.deposit(2000)
p account.withdraw(500)

p "----------"
statement = Statement.new(account)
p "New statement: #{statement}"
print statement.display
