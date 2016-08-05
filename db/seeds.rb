# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

new_join1 = CategorizedProduct.new(product_id: 1, category_id: 2)
new_join1.save
new_join2 = CategorizedProduct.new(product_id: 2, category_id: 1)
new_join2.save
new_join3 = CategorizedProduct.new(product_id: 2, category_id: 4)
new_join3.save
new_join4 = CategorizedProduct.new(product_id: 3, category_id: 2)
new_join4.save
new_join5 = CategorizedProduct.new(product_id: 4, category_id: 3)
new_join5.save
new_join6 = CategorizedProduct.new(product_id: 4, category_id: 7)
new_join6.save
new_join7 = CategorizedProduct.new(product_id: 5, category_id: 1)
new_join7.save
new_join8 = CategorizedProduct.new(product_id: 18, category_id: 1)
new_join8.save
new_join9 = CategorizedProduct.new(product_id: 19, category_id: 6)
new_join9.save
