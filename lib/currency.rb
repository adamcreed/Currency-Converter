require_relative 'currency_errors'

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
    if same_currency_code?(@currency_code, second_currency.currency_code)
      Currency.new(@amount + second_currency.amount, @currency_code)
    end
  end

  def -(second_currency)
    if same_currency_code?(@currency_code, second_currency.currency_code)
      Currency.new(@amount - second_currency.amount, @currency_code)
    end
  end

  def *(factor)
    Currency.new(@amount * factor, @currency_code)
  end

  def same_currency_code?(first, second)
    if first == second
      true

    else
      raise DifferentCurrencyCodeError
    end
  end

end
