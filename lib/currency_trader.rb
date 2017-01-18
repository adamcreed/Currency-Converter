class CurrencyTrader
  attr_reader :first_converter, :second_converter, :starting_currency

  def initialize(first_converter, second_converter, starting_currency)
    @first_converter = first_converter
    @second_converter = second_converter
    @starting_currency = starting_currency
  end
end
