# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
p 'starting seeding...'
(1..5).each do |num|
  rest = Restaurant.new(
    {
      name: "name#{num}",
      address:"address#{num}",
      phone_number:"phone_number#{num}",
      category:["chinese", "italian", "japanese", "french", "belgian"].sample,
    }
  )
  rest.save!
  p rest
end
p Restaurant.all
Restaurant.all.each do |rest|
  (1..5).each do |number|
    review = Review.new({
      rating: rand(1..5),
      content: "content#{number}",
      restaurant: rest
    })
    review.save!
    p review
  end
end
p 'seeding done'
