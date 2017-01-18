require 'currency_converter'

describe 'CurrencyConverter' do
  currency_converter = CurrencyConverter.new

  describe '#new' do
    it 'Creates a new CurrencyConverter object with a hash of rates.' do

      expect(currency_converter.rates['USD']['USD']).to eq 1.0
    end
  end


end
