module ApplicationHelper
  def number_to_uah(amount)
    number_to_currency(amount, unit: '₴')
  end

  def enum_select(items)
    items.keys.map { |w| [w.humanize, w] }
  end

  def option_select_collection(items)
    items.map { |i| [i.value + i.measurement, i.id] }
  end

  def option_measurements_collection(items)
    measurement = items.first.measurement

    items.map { |i| [i.value + ' ' + measurement, i.option_value_id] }
  end

  def nested_dropdown(items)
    result = []
    items.map do |item, sub_items|
      result << [('- ' * item.depth) + item.name, item.id]
      result += nested_dropdown(sub_items) if sub_items.present?
    end
    result
  end
  
  def current_locale?(locale)
    I18n.locale == locale
  end
end
