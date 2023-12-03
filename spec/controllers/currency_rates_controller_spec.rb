# spec/controllers/currency_rates_controller_spec.rb
require 'rails_helper'

RSpec.describe CurrencyRatesController, type: :controller do
  describe 'GET #index' do
    before do
      ['USD', 'EUR', 'CNY'].each do |currency|
        CurrencyRate.create(currency: currency, rate: rand(1.0..2.0), date: 1.month.ago)
      end
      get :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'assigns @currency_rates correctly' do
      expect(assigns(:currency_rates)).not_to be_empty
      expect(assigns(:currency_rates).map(&:currency)).to include('USD', 'EUR', 'CNY')
    end
  end

  describe 'GET #weekly_change' do
    before do
      ['USD', 'EUR', 'CNY'].each do |currency|
        CurrencyRate.create(currency: currency, rate: rand(1.0..2.0), date: 4.weeks.ago.beginning_of_week)
      end
      get :weekly_change
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the weekly_change template' do
      expect(response).to render_template(:weekly_change)
    end

    it 'assigns @currency_changes correctly' do
      expect(assigns(:currency_changes)).not_to be_empty
      expect(assigns(:currency_changes).keys).to include('USD', 'EUR', 'CNY')
    end
  end
end
