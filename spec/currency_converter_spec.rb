require 'currency_converter'

describe 'CurrencyConverter' do
  currency_converter = CurrencyConverter.new

  describe '#new' do
    it 'Creates a new CurrencyConverter object with a hash of rates.' do

      expect(currency_converter.rates['USD']['USD']).to eq 1.0
    end
  end

  describe '#convert' do
    context 'When the source and target currency codes are the same' do
      it 'Creates a currency object equal to the original object.' do

        expect(currency_converter.convert(Currency.new(1, 'USD'), 'USD') \
                == Currency.new(1, 'USD')).to eq true
      end
    end

    context 'When converting to a different currency' do
      it 'Creates a new currency object with an equivalent amount in ' \
          'the new currency' do

        one_dollar = Currency.new(1, 'USD')
        one_dollar_in_yen = currency_converter.convert(one_dollar, 'JPY')

        expect(one_dollar_in_yen.amount).to eq 112.911
        expect(one_dollar_in_yen.currency_code).to eq 'JPY'
      end
    end
  end
end
