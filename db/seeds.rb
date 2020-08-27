require "faker"
require "open-uri"

User.destroy_all
Book.destroy_all
ADRESSES = ["baars 14 1511LD Oostzaan", "spiegelgracht 10, Amsterdam"]

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

  file1 = URI.open('https://res.cloudinary.com/df2nlavdo/image/upload/v1598447202/image_tbowfr.png')
  file2 = URI.open('https://res.cloudinary.com/df2nlavdo/image/upload/v1598447200/image_4_rg0pyh.png')
  file3 = URI.open('https://res.cloudinary.com/df2nlavdo/image/upload/v1598447200/image_1_xn1jnh.png')
  file4 = URI.open('https://res.cloudinary.com/df2nlavdo/image/upload/v1598447200/image_2_fxvag9.png')
  file5 = URI.open('https://res.cloudinary.com/df2nlavdo/image/upload/v1598447201/image_3_dsum4k.png')

  book1 = Book.new(
    book_title: "Don Quixote", user: user, isbn_number: 31698, book_price: 2, condition: "as new", description: "Don Quixote kicks ass", location: ADRESSES.sample, author: "Miguel Cervantes", photo: "https://res.cloudinary.com/df2nlavdo/image/upload/v1598447202/image_tbowfr.png")
  book2 = Book.new(
    book_title: "Ulysses", user: user, isbn_number: 73456, book_price: 3, condition: "used", description: "A man is bored in ireland", location: ADRESSES.sample, author: "James Joyce", photo: "https://res.cloudinary.com/df2nlavdo/image/upload/v1598447200/image_4_rg0pyh.png")
  book3 = Book.new(
    book_title: "1984", user: user, isbn_number: 54653, book_price: 10, condition: "brand new", description: "google steals everyone's data and ruins the world", location: ADRESSES.sample, author: "George Orwell", photo: "https://res.cloudinary.com/df2nlavdo/image/upload/v1598447200/image_1_xn1jnh.png")
  book4 = Book.new(
    book_title: "The Great Gatsby", user: user, isbn_number: 74589, book_price: 1, condition: "very very bad - Donald Trump", description: "A very rich man has parties to stalk his crush", location: ADRESSES.sample, author: "F. Scott Fitzgerald", photo: "https://res.cloudinary.com/df2nlavdo/image/upload/v1598447200/image_2_fxvag9.png")
  book5 = Book.new(
    book_title: "The House Of Spirits", user: user, isbn_number: 68909, book_price: 55, condition: "It's Amazing, That's how new it is. It's Amazing. - Donald Trump", description: "A bunch of people drive eachother crazy during dictatorship in Chile.", location: ADRESSES.sample, author: "Isabelle Allende", photo: "https://res.cloudinary.com/df2nlavdo/image/upload/v1598447201/image_3_dsum4k.png")

  book1.photo.attach(io: file1, filename: 'Don Quixote image', content_type: 'image/png')
  book2.photo.attach(io: file2, filename: 'Ulysses image', content_type: 'image/png')
  book3.photo.attach(io: file3, filename: '1984 image', content_type: 'image/png')
  book4.photo.attach(io: file4, filename: 'The Great Gatsby image', content_type: 'image/png')
  book5.photo.attach(io: file5, filename: 'The House Of Spirits image', content_type: 'image/png')

  book1.save!
  book2.save!
  book3.save!
  book4.save!
  book5.save!


end

puts "#{Book.count} books created"
puts 'Finished!'

