class Transaction
  def initialize(type, amount)
    @type = type
    @amount = amount
    @date = Time.now.strftime("%m/%d/%y")
  end
end