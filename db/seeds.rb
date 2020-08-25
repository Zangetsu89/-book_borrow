require "faker"

User.destroy_all

puts 'Creating 5 fake users...'
5.times do
  user = User.new(
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Number.number(digits: 10)
  )
  user.save!
  puts "Created #{user.first_name}, #{user.last_name}, #{user.email}, #{user.password}"
end
puts 'Finished!'