class Account
  def initialize
    @balance = 0
    @transfers = ["date || credit || debit || balance"]
  end

  def deposit(amount)
    @balance += amount
    @transfers.insert(1, "#{current_date} || #{"%.2f" % amount} || || #{"%.2f" % @balance}") 
    "Deposit of #{amount} made. Balance: #{@balance}."
  end

  def withdraw(amount)
    @balance -= amount
    @transfers.insert(1, "#{current_date} || || #{"%.2f" % amount} || #{"%.2f" % @balance}") 
    "Withdrawal of #{amount} made. Balance: #{@balance}."
  end

  def print_statement
    # print @statement.join("\n")
    @transfers.join("\n")
  end

  private

  def current_date
    Time.now.strftime("%m/%d/%y")
  end
end