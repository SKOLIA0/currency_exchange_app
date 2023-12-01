require 'net/http'
require 'json'
require 'nokogiri'
require 'byebug'
require 'open-uri'

class CurrencyRate < ApplicationRecord
  validates :currency, presence: true
  validates :rate, numericality: { greater_than: 0 }
  def self.update_rates
    url = 'https://www.cbr.ru/scripts/XML_daily.asp'
    begin
      response = Net::HTTP.get(URI(url))
      xml_data = Nokogiri::XML(response)

      ActiveRecord::Base.transaction do
        xml_data.xpath('//ValCurs/Valute').each do |valute|
          char_code = valute.xpath('CharCode').text
          next unless ['USD', 'EUR', 'CNY'].include?(char_code)

          nominal = valute.xpath('Nominal').text.to_i
          value = valute.xpath('Value').text.gsub(',', '.').to_f

          # Проверка на уникальность записи перед сохранением
          next if CurrencyRate.exists?(currency: char_code, date: Date.today)

          CurrencyRate.create(currency: char_code, rate: value / nominal, date: Date.today)
        end
      end

      Rails.logger.info "Currency rates updated successfully."
    rescue => e
      Rails.logger.error "Error updating currency rates: #{e.message}"
    end
  end
end

