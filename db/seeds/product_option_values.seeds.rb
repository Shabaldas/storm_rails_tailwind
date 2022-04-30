after :product_options do
  ProductOption.all.each do |option|
    # binding.irb
    3.times do
      ProductOptionValue.create(
        product_option: option,
        option_value: OptionValue.order(Arel.sql('RANDOM()')).first,
        price: Faker::Number.between(from: 1, to: 100)
      )
      print '.'.green
    end
  end
end
