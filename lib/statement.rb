class Statement
  def initialize(account)
    @account = account
    @balance = 0
  end

  def print
    headings = "date || credit || debit || balance"
    @account.show_transactions.empty? ? headings : [headings, format_transactions].join("\n")
  end

  private 

  def format_transactions
    @account.show_transactions.map do |transaction|
      transaction[:type] == "deposit" ? deposit(transaction) : withdraw(transaction)
    end
      .reverse
  end

  def deposit(transaction)
    @balance += transaction[:amount]
    "#{transaction[:date]} || #{"%.2f" % transaction[:amount]} || || #{"%.2f" % @balance}"
  end

  def withdraw(transaction)
    @balance -= transaction[:amount]
    "#{transaction[:date]} || || #{"%.2f" % transaction[:amount]} || #{"%.2f" % @balance}"
  end
end