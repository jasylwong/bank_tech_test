class Account
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    save_transaction("deposit", amount)
    "Deposit of #{amount} made. Balance: #{@balance}."
  end

  def withdraw(amount)
    @balance -= amount
    save_transaction("withdrawal", amount)
    "Withdrawal of #{amount} made. Balance: #{@balance}."
  end
  
  def show_transactions
    @transactions
  end

  def balance
    @balance
  end

  private

  def current_date
    Time.now.strftime("%m/%d/%y")
  end

  def save_transaction(type, amount)
    @transactions.push({date: current_date, type: type, amount: amount})
  end
end