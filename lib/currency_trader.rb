class CurrencyTrader
  attr_reader :first_converter, :second_converter, :starting_currency

  def initialize(first_converter, second_converter, starting_currency)
    @first_converter = first_converter
    @second_converter = second_converter
    @starting_currency = starting_currency
  end

  def find_best_exchange
    best_exchange = @first_converter.rates[@starting_currency][@starting_currency]
    best_exchange_key = @starting_currency

    @first_converter.rates[@starting_currency].each_key do |code|
      best_exchange_key = compare_rates(best_exchange, best_exchange_key, code)
    end

    best_exchange_key
  end

  def compare_rates(best_exchange, best_exchange_key, code)
    if @first_converter.rates[@starting_currency][code] \
        / @second_converter.rates[@starting_currency][code] > best_exchange

      best_exchange_key = code
    end

    best_exchange_key
  end
end
