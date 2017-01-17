require 'currency.rb'

describe 'Currency' do
  describe '#new' do
    it 'Creates a new Currency object with an amount and a currency code.' do
      my_wallet = Currency.new(50, 'USD')
      expect(my_wallet.amount).to eq 50
      expect(my_wallet.currency_code).to eq 'USD'
    end
  end
end