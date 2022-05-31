module ApplicationHelper
  include Pagy::Frontend

  COLORS = ['FFFFFF', 'E9646B', 'F1C232', '000000', '96E06C', '67ACEC'].freeze
  MATERIALS = ['PLA', 'ABS', 'PET', 'Nylon', 'Elastan'].freeze
  QUALITY = [100, 200, 300].freeze

  def number_to_uah(amount)
    number_to_currency(amount, unit: '₴ ', precision: 0)
  end

  def enum_select(items)
    items.keys.map { |w| [w.humanize, w] }
  end

  def option_select_collection(items)
    items.map { |i| [i.value + i.measurement, i.id] }
  end

  def option_measurements_collection(items)
    measurement = items.first.measurement

    items.map { |i| ["#{i.value} #{measurement}", i.option_value_id] }
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

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
