# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = [
  [ "Gala Apples", 1.99 , "USA" ],
  [ "Orange", 2 , "USA" ],
  [ "Almond", 3 , "USA" ],
  [ "Cashew", 4 , "USA" ],
  [ "Breakfast Blend Coffee", 5 , "Africa" ],
  [ "Medium Roast Coffee", 5 , "Colombia" ],
  [ "Dark Roast Coffee", 5 , "Costa Rica" ],
  [ "Pink Lady", 1 , "USA" ],
  [ "Tangerine", 2 , "USA" ],
  [ "Pastachio", 3 , "USA" ],
  [ "Cake", 4 , "USA" ],
]

products.each do |name, cost, country|
  Product.create( name: name, cost: cost, country:country)
end
