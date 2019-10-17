require 'faker'    

puts "Seeding users......."
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')

User.create!(
    email: 'test@test.com',
    password: '123456'
)

puts "Seeding places........"
Place.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('places')

6.times do |i|
    Place.create!(
        name: Faker::Company.catch_phrase,
        description: Faker::Lorem.sentence(word_count: 25),
        address: Faker::Address.full_address
    )
  end

puts "Done!"

