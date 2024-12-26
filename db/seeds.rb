# Seed data for category_utilities
category_utility_names = [
  'peralatan kiosk',
  'peralatan sokongan memasak',
  'peralatan sokongan promosi',
  'lain-lain'
]

category_utility_names.each do |name|
  CategoryUtility.find_or_create_by(name: name)
end

puts "Category utilities seeded successfully!"

# Seed data for category_products
category_product_names = [
  'Dim Sum',
  'Pau Mini',
  'Karipap',
  'lain-lain'
]

category_product_names.each do |name|
  CategoryProduct.find_or_create_by(name: name)
end

puts "Category products seeded successfully!"
