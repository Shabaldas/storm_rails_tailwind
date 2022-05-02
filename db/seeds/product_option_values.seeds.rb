after :product_options do
  ProductOption.all.each do |option|
    OptionValue.where(option_id: option[:option_id]).each do |value|
      ProductOptionValue.create(
        product_option: option,
        option_value: value,
        price: Faker::Number.between(from: 1, to: 100)
      )
      print '.'.green
    end
  end
end
