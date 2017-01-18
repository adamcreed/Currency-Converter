require_relative 'currency_errors'

class CurrencyConverter
  attr_reader :rates

  def initialize
    @rates = {'USD' => {'USD' => 1.0, 'EUR' => 0.93483, 'JPY' => 112.911},
             'EUR' => {'USD' => 1.06971, 'EUR' => 1.0, 'JPY' => 120.782},
             'JPY' => {'USD' => 0.00886, 'EUR' => 0.00828, 'JPY' => 1.0}}
  end

  def convert(currency, target_currency)
    Currency.new(currency.amount * \
            @rates[currency.currency_code][target_currency], target_currency)
  end

end
