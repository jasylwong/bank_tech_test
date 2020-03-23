class Account
  def initialize
    @balance = 0
    @statement = ["date || credit || debit || balance"]
  end

  def print_statement
    # print @statement.join("\n")
    @statement.join("\n")
  end

  def deposit(amount)
    @balance += amount
    @statement.insert(1, "10/01/2012 || #{"%.2f" % amount} || || #{"%.2f" % @balance}") 
    "Deposit of #{amount} made. Balance: #{@balance}."
  end
end