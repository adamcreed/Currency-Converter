class Currency
  attr_accessor :amount, :currency_code

  def initialize(amount, currency_code)
    @amount = amount
    @currency_code = currency_code
  end
end
