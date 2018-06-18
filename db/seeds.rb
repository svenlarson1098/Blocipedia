require 'random_data'

#create Users
5.times do
  User.create!(
    email:      RandomData.random_email,
    password:   RandomData.random_sentence
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
10.times do
  Wiki.create!(
    user: users.sample,
    title: RandomData.random_sentence, 
    body: RandomData.random_paragraph
    )
end

wikis = Wiki.all

puts "Seeds finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"