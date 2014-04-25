require 'faker'

5.times do 
  List.create(
    title: Faker::Lorem.sentence
  )
end

lists = List.all

5.times do
  Item.create(
    list: lists.sample,
    body: Faker::Lorem.paragraph
  )
end


puts "Seed finished"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
