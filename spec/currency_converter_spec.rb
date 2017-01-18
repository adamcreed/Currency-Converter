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
      it 'Creates a new JPY currency object with an equivalent amount to ' \
          'the USD currency' do

        one_dollar = Currency.new(1, 'USD')
        one_dollar_in_yen = currency_converter.convert(one_dollar, 'JPY')

        expect(one_dollar_in_yen.amount).to eq 112.911
        expect(one_dollar_in_yen.currency_code).to eq 'JPY'
      end

      it 'Creates a new EUR currency object with an equivalent amount to ' \
          'the JPY currency' do

        a_fistful_of_yen = Currency.new(10500, 'JPY')
        a_fistful_of_euros = currency_converter.convert(a_fistful_of_yen, 'EUR')

        expect(a_fistful_of_euros.amount).to eq 86.94
        expect(a_fistful_of_euros.currency_code).to eq 'EUR'
      end
    end
  end

  describe '#unknown_currency_code?' do
    it 'Raises a UnknownCurrencyCodeError when attempting to convert ' \
       'to or from an unrecognized currency code' do

      twenty_dollars = Currency.new(20, 'USD')

      expect{ currency_converter.convert(twenty_dollars, 'GBP') }.to \
             raise_error(UnknownCurrencyCodeError)
    end
  end
end
