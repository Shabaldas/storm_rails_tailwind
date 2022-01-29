after :product_categories do
  ProductCategory.all.each do |category|
    10.times do
      Product.create(
        name: Faker::Commerce.product_name,
        category: category,
        description: Faker::Lorem.paragraph
      )
      print '.'.green
    end
  end
end
