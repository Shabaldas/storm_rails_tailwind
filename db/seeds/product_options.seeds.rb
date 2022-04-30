after :products do
  Product.all.each do |product|
    3.times do
      ProductOption.create(
        product: product,
        option: Option.order(Arel.sql('RANDOM()')).first,
        primary: Faker::Boolean.boolean
      )
      print '.'.green
    end
  end
end
