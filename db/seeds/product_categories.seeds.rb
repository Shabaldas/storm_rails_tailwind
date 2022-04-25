ProductCategory.all.destroy_all

10.times do
  ProductCategory.create(name: Faker::Commerce.department)
  print '.'.green
end
