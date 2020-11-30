# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

puts "start time is #{Time.now}"
puts "----------------------------------"

Feedback.destroy_all
Post.destroy_all
User.destroy_all

Feedback.destroy_all

puts "creating user"

User.create(first_name: 'John', last_name: 'Smith', user_name: 'John Smith', email: 'a@a.com', password: '654321')
User.create(first_name: 'Sam', last_name: 'Bam', user_name: 'Sam Bam', email: 'bb@a.com', password: '65432134')

puts "creating post and feedback"

10.times do
  post = Post.create(
    title: Faker::Company.catch_phrase,
    description: Faker::Quote.famous_last_words,
    user: User.all.sample
  )

  1.times do

    feedback = Feedback.create(
      user: User.last,
      description: Faker::Quote.famous_last_words,
      post: post
      )
end
end


puts "----------------------------------"
puts "#{Post.count} Posts created"
puts "#{User.count} Users created"
puts "#{Feedback.count} Feedback created"
puts "----------------------------------"

puts "end time is #{Time.now}"

