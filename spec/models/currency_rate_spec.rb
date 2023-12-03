# spec/models/currency_rate_spec.rb
require 'rails_helper'

RSpec.describe CurrencyRate, type: :model do
  # Тесты для валидности с разными валютами
  ['USD', 'EUR', 'CNY'].each do |currency|
    context "with #{currency} currency" do
      it 'is valid with valid attributes' do
        currency_rate = CurrencyRate.new(currency: currency, rate: 1.0, date: Date.today)
        expect(currency_rate).to be_valid
      end

      it 'is not valid without a rate' do
        currency_rate = CurrencyRate.new(currency: currency, date: Date.today)
        expect(currency_rate).to_not be_valid
      end

      it 'is not valid with a rate less than or equal to zero' do
        currency_rate = CurrencyRate.new(currency: currency, rate: 0, date: Date.today)
        expect(currency_rate).to_not be_valid
      end
    end
  end

  it 'is not valid without a currency' do
    currency_rate = CurrencyRate.new(rate: 1.0, date: Date.today)
    expect(currency_rate).to_not be_valid
  end
end
