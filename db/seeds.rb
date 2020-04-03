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

addresses = [
    '6817 43 Av Montreal QC H1T 2R9',
    '7503 Rue St Denis Montreal QC H2R 2E7',
    '251 Av Percival Montreal Ouest QC H4X 1T8',
    '7766 George Street Lasalle QC H8P 1E1',
    '11727 Rue Notre Dame E Montreal QC H1B 2X8',
    '5745 17 Av Montreal QC H1X 2R7'
]

addresses.each do |address| 
    Place.create!(
        name: Faker::Company.catch_phrase,
        description: Faker::Lorem.sentence(word_count: 25),
        address: address
    )
  end

puts "Done!"

