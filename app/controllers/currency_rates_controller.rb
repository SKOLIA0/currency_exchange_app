class CurrencyRatesController < ApplicationController
  def index
    # Получение данных за последний месяц
    @currency_rates = CurrencyRate.where('date >= ?', 1.month.ago).order(date: :asc)

    # Преобразование данных для графика
    prepare_chart_data
  end

  def weekly_change
    @currency_changes = CurrencyRate.where(currency: ['USD', 'EUR', 'CNY'])
                                    .where('date >= ?', 4.weeks.ago.beginning_of_week)
                                    .group_by(&:currency)
                                    .transform_values { |rates| weekly_change_calculation(rates) }
  end

  private

  def prepare_chart_data
    dates = @currency_rates.map(&:date).uniq
    usd_rates = dates.map { |date| @currency_rates.find { |rate| rate.date == date && rate.currency == 'USD' }&.rate.to_f }
    eur_rates = dates.map { |date| @currency_rates.find { |rate| rate.date == date && rate.currency == 'EUR' }&.rate.to_f }
    cny_rates = dates.map { |date| @currency_rates.find { |rate| rate.date == date && rate.currency == 'CNY' }&.rate.to_f }


    @chart_data = {
      x:   ['date'].concat(dates.map(&:to_s)),
      usd: ['USD'].concat(usd_rates),
      eur: ['EUR'].concat(eur_rates),
      cny: ['CNY'].concat(cny_rates)
    }

  end

  def weekly_change_calculation(rates)
    # Логика расчета изменения цен за каждую неделю
    rates.sort_by(&:date).group_by { |rate| rate.date.beginning_of_week }.transform_values do |weekly_rates|
      { start_of_week: weekly_rates.first.rate, end_of_week: weekly_rates.last.rate }
    end
  end
end
