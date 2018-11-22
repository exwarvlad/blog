# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |index|
  category = Category.create(name: "Годный контент_#{index + 1}", description: "Топ #{index + 1}")
  Post.create(name: "Дневник хача #{index + 1}", category_id: category.id, content: '')
end