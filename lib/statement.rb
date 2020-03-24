class Statement
  def initialize(account)
    @account = account
    @balance = 0
  end

  def print
    headings = "date || credit || debit || balance"
    format_transactions.unshift(headings).join("\n")
  end

  private 

  def format_transactions
    @account.transactions.map do |transaction|
      transaction.type == "deposit" ? show_deposit(transaction) : show_withdraw(transaction)
    end
      .reverse
  end

  def show_deposit(transaction)
    @balance += transaction.amount
    "#{transaction.date} || #{"%.2f" % transaction.amount} || || #{"%.2f" % @balance}"
  end

  def show_withdraw(transaction)
    @balance -= transaction.amount
    "#{transaction.date} || || #{"%.2f" % transaction.amount} || #{"%.2f" % @balance}"
  end
end