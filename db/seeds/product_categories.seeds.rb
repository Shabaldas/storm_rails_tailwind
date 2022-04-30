ProductCategory.all.destroy_all

5.times do
  ProductCategory.create(name: Faker::Commerce.department)
  print '.'.green
end
