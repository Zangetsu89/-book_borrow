require "faker"

User.destroy_all
Book.destroy_all

puts 'Creating 5 fake users...'
User.create(first_name: "david", last_name: "l", email: "a@a.com", password: 123456)
5.times do
  user = User.new(
    first_name: Faker::Name.name,
    last_name:  Faker::Name.name,
    email:      Faker::Internet.email,
    password:   Faker::Number.number(digits: 6)
  )

  user.save!
  puts "Created #{user.first_name}, #{user.last_name}, #{user.email}, #{user.password}"
  puts
  puts 'Creating 5 fake books...'

5.times do
  book = Book.new(
    book_title:  Faker::Superhero.name,
    isbn_number: Faker::Number.number(digits: 5),
    book_price:  Faker::Number.number(digits: 1),
    condition:   ["new", "used"].sample,
    description: Faker::ChuckNorris.fact,
    location:    Faker::Address.city,
    author:      Faker::Name.name,
  )

  book.user = user

  book.save!
  puts "Created #{book.book_title}, #{book.isbn_number}, #{book.book_price}, #{book.condition}, #{book.description}, #{book.location}, #{book.author}"
end
end
puts 'Finished!'

