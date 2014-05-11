require 'faker'

5.times do 
  List.create(
    description: Faker::Lorem.sentence
  )
end


5.times do
  ListItem.create(
    content: Faker::Lorem.paragraph
  )
end


puts "Seed finished"
puts "#{List.count} lists created"
puts "#{ListItem.count} items created"
