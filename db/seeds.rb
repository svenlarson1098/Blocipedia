require 'random_data'

#create Users
5.times do
  User.create!(
    email:      Faker::Internet.email,
    password:   RandomData.random_sentence
    )
end

#Create Standard User:
1.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'helloworld'
    )
  end

#Create Premium User
1.times do
  User.create!(
    email:  'svenlarson1098@gmail.com',
    password: 'helloworld',
    role: 1
    )
end


#Create Admin
1.times do 
  User.create!(
    email: 'svucker@gmail.com', 
    password: 'helloworld',
    role: 2
    )
end

users = User.all

#Create wikis
20.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Name.title, 
    body: Faker::StarWars.quote
    #body: RandomData.random_paragraph
    )
end

wikis = Wiki.all

puts "Seeds finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"