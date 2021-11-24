# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

name = ['GULLIGAST', 'KLAPPA Musical Toy']

description = ["This mobile has soft figures inspired by nature and creates an exciting eye-catcher above the changing table. All faces and patterns meet the baby's gaze and create a calming mood for diaper changes.", "Play is a way for your baby to develop their senses and interaction with you and the world. With this musical toy from the KLAPPA toys collection, we want to stimulate this important journey of discovery.", ]

images = ["https://www.ikea.com/nl/en/images/products/gulligast-mobile__0923957_pe788456_s5.jpg?f=xxs", "https://www.ikea.com/nl/en/images/products/klappa-musical-toy-caterpillar__0606298_pe682201_s5.jpg?f=xl",  ]

names.each_with_index do |name, index|
  toy = Toy.new(
    name: name,
    description: descriptions[index],
  )
  toy.save!

  file = URI.open(images[index])
  toy.images.attach(io: file, filename: "camper.png", content_type: "image/png")

  puts "Done!"
end
