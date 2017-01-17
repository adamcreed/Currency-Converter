class Currency
  attr_accessor :amount, :currency_code

  def initialize(amount, currency_code)
    @amount = amount
    @currency_code = currency_code
  end

  def ==(second_wallet)
    @amount == second_wallet.amount and @currency_code == second_wallet.currency_code
  end
end
