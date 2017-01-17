require 'currency'

describe 'Currency' do
  my_wallet = Currency.new(50, 'USD')
  one_hundred_yen = Currency.new(100, 'JPY')

  describe '#new' do
    it 'Creates a new Currency object with an amount and a currency code.' do

      expect(my_wallet.amount).to eq 50
      expect(my_wallet.currency_code).to eq 'USD'
    end
  end

  describe '#==' do
    it 'Checks for equality between two currency objects.' do
      also_my_wallet = Currency.new(50, 'USD')

      expect(my_wallet == also_my_wallet).to eq true
    end
    it 'Checks for inequality between two currency objects.' do
      not_my_wallet = Currency.new(2000, 'USD')
      also_not_my_wallet = Currency.new(50, 'JPY')

      expect(my_wallet == not_my_wallet).to be false
      expect(my_wallet == also_not_my_wallet).to be false
    end
  end

  describe '#+' do
    it 'Adds the amount attribute of two currency objects together' do
      money_on_the_ground = Currency.new(5, 'USD')

      my_new_wallet = my_wallet + money_on_the_ground

      expect(my_new_wallet.amount).to eq 55
    end
  end

  describe '#-' do
    it 'Subtracts the amount attribute of the second currency object from the first' do
      rent = Currency.new(550, 'USD')

      wallet_after_rent = my_wallet - rent

      expect(wallet_after_rent.amount).to eq -500
    end
  end

  describe '#different_currency_code?' do
    it 'Raises a DifferentCurrencyCodeError when two currencies with different ' \
       'codes are attempting to be added or subtracted.' do

      twenty_dollars = Currency.new(20, 'USD')

      expect{ twenty_dollars += one_hundred_yen }.to \
             raise_error(DifferentCurrencyCodeError)
    end
  end

  describe '#*' do
    it "Multiplies the currency's amount with a float or integer." do
      five_hundred_fifty_yen = one_hundred_yen * 5.5

      expect(five_hundred_fifty_yen.amount).to eq 550
    end
  end

  describe '#new' do
    context 'When only one argument is passed' do
      it 'Checks the first character of the amount for a currency symbol, ' \
         'then uses that to determine the currency code' do
           thirty_bucks = Currency.new('$30')

           expect(thirty_bucks.amount).to eq 30
           expect(thirty_bucks.currency_code).to eq 'USD'
      end
    end
  end
end
