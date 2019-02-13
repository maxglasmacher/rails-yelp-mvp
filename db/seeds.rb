require "faker"
Restaurant.destroy_all
puts 'Creating 10 fake restaurants...'
10.times do
  restaurant = Restaurant.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number,
    category: ["french", "italian", "spanish", "german", "chinese", "belgian", "japanese"].sample
  )
  5.times do
  review = Review.new(
    content: Faker::GreekPhilosophers.quote,
    rating: rand(1..5)
  )
  review.restaurant = restaurant
  review.save!
  end
  restaurant.save!
end
puts 'Finished!'
