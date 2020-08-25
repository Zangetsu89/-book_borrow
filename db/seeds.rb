require "faker"

User.destroy_all

puts 'Creating 5 fake users...'
5.times do
  user = User.new(
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::String,
  )
  User.save!
  puts "Created #{user.first_name}, #{user.last_name}, #{user.email}, #{user.password}"
end
puts 'Finished!'

Book.destroy_all

puts 'Creating 5 fake books...'
5.times do
  book = Book.new(
  isbn_number: Faker::
  book_price:  Faker::
  new:         Faker::
  description: Faker::
  location:    Faker::
  author:      Faker::
  )
  book.save!
  puts "Created #{book.first_name}, #{book.last_name}, #{book.email}, #{book.password}"
end
puts 'Finished!'
