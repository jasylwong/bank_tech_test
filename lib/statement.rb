class Statement
  def initialize(account)
    @account = account
    @balance = 0
  end

  def display
    headings = "date || credit || debit || balance"
    format_transactions.unshift(headings).join("\n")
  end

  private 

  def format_transactions
    @account.transactions.map do |transaction|
      "#{transaction.date} || #{show_deposit(transaction)}|| #{show_withdrawal(transaction)}|| #{show_balance(transaction)}"
    end
      .reverse
  end

  def show_deposit(transaction)
    "%.2f" % transaction.amount + " " if deposit?(transaction)
  end

  def show_withdrawal(transaction)
    "%.2f" % transaction.amount + " " unless deposit?(transaction)
  end

  def show_balance(transaction)
    "%.2f" % @balance += (deposit?(transaction) ? transaction.amount : -transaction.amount)
  end

  def deposit?(transaction)
    transaction.type == "deposit"
  end
end
