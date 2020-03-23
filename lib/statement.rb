class Statement

  def initialize(account)
    @account = account
  end

  def print
    "date || credit || debit || balance"
    # @account.show_transactions.map {|transaction|
    #   "#{current_date} || #{"%.2f" % amount} || || #{"%.2f" % @balance}"
    # }
  end
  
  # @transactions.insert(1, "#{current_date} || #{"%.2f" % amount} || || #{"%.2f" % @balance}") 
end