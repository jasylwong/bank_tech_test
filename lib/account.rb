class Account
  attr_reader :transactions, :balance

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    save_transaction("deposit", amount)
    "Deposit of #{amount} made. Balance: #{@balance += amount}."
  end

  def withdraw(amount)
    save_transaction("withdrawal", amount)
    "Withdrawal of #{amount} made. Balance: #{@balance -= amount}."
  end

  private

  def save_transaction(type, amount)
    @transactions.push(Transaction.new(type: type, amount: amount))
  end
end
