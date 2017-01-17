class Currency
  attr_accessor :amount, :currency_code

  def initialize(amount, currency_code)
    @amount = amount
    @currency_code = currency_code
  end

  def ==(second_currency)
    @amount == second_currency.amount and @currency_code == second_currency.currency_code
  end

  def +(second_currency)
    Currency.new(@amount + second_currency.amount, @currency_code)
  end
end
