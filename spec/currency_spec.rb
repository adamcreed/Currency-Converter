require 'currency.rb'

describe 'Currency' do
  describe '#new' do
    it 'Creates a new Currency object with an amount and a currency code.' do
      my_wallet = Currency.new(50, 'USD')

      expect(my_wallet.amount).to eq 50
      expect(my_wallet.currency_code).to eq 'USD'
    end
  end

  describe '#==' do
    it 'Checks for equality between two currency objects.' do
      my_wallet = Currency.new(50, 'USD')
      also_my_wallet = Currency.new(50, 'USD')

      expect(my_wallet == also_my_wallet).to eq true
    end
    it 'Checks for inequality between two currency objects.' do
      my_wallet = Currency.new(50, 'USD')
      not_my_wallet = Currency.new(2000, 'USD')
      also_not_my_wallet = Currency.new(50, 'JPY')

      expect(my_wallet == not_my_wallet).to be false
      expect(my_wallet == also_not_my_wallet).to be false
    end
  end

  describe '#+' do
    it 'Adds the amount attribute of two currency objects together' do
      my_wallet = Currency.new(50, 'USD')
      money_on_the_ground = Currency.new(5, 'USD')

      my_wallet += money_on_the_ground

      expect(my_wallet.amount).to eq 55
    end
  end

  describe '#-' do
    it 'Subtracts the amount attribute of the second currency object from the first' do
      my_wallet = Currency.new(50, 'USD')
      rent = Currency.new(550, 'USD')

      my_wallet -= rent

      expect(my_wallet.amount).to eq -500
    end
  end
end
