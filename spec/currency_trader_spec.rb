require 'currency_trader'

describe 'CurrencyTrader' do
  first_rates = {'USD' => {'USD' => 1.0, 'EUR' => 0.93483, 'JPY' => 112.911},
                 'EUR' => {'USD' => 1.06971, 'EUR' => 1.0, 'JPY' => 120.782},
                 'JPY' => {'USD' => 0.00886, 'EUR' => 0.00828, 'JPY' => 1.0}}

  second_rates = {'USD' => {'USD' => 1.0, 'EUR' => 0.93512, 'JPY' => 113.045},
                  'EUR' => {'USD' => 1.06938, 'EUR' => 1.0, 'JPY' => 120.888},
                  'JPY' => {'USD' => 0.00885, 'EUR' => 0.00827, 'JPY' => 1.0}}

  first_converter = CurrencyConverter.new(first_rates)
  second_converter = CurrencyConverter.new(second_rates)
  currency_trader = CurrencyTrader.new(first_converter, second_converter, 'EUR')

  describe '#new' do
    it 'Creates a new CurrencyTrader object with two CurrencyConverter objects ' \
       'and a starting currency' do

      expect(currency_trader.second_converter.rates['USD']['EUR']).to eq 0.93512
      expect(currency_trader.starting_currency).to eq 'EUR'
    end
  end
end
