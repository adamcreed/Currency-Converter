require_relative 'currency_errors'

class Currency
  attr_accessor :amount, :currency_code

  def initialize(amount, currency_code = '')
    if currency_code == ''
      @amount = get_amount_without_symbol(amount)
      @currency_code = check_first_char(amount)

    else
      @amount = amount
      @currency_code = currency_code
    end
  end

  def get_amount_without_symbol(amount)
    amount[1..-1].to_i
  end

  def check_first_char(amount)
    if amount[0] =~ /[$€¥]/
      read_currency_symbol(amount)

    elsif amount[0] =~ /[0-9]/
      raise MissingCurrencyType

    else
      raise UnrecognizedCurrencySymbol
    end
  end

  def read_currency_symbol(amount)
    case amount[0]
    when '$'
      'USD'

    when '€'
      'EUR'

    when '¥'
      'JPY'
    end
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
