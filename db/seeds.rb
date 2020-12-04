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
PostCategory.destroy_all
Post.destroy_all
User.destroy_all
Category.destroy_all

puts "creating user"

User.create(name: 'John Smith', username: 'johnsmith', email: 'a@a.com', password: '654321', location: "Amsterdam", biography: "looking for great oportunities in ux design", experience: 2)
User.create(name: 'Sam Bam', username: 'sambam', email: 'bb@a.com', password: '65432134', location: "New York", biography: "looking for great oportunities in logo design", experience: 4)

puts "creating categories"

CATEGORIES = ["Logo & identity", "App & web design", "Business & advertising", "Art & illustration", "Other" ]
CATEGORIES.each do |category|
  Category.create(name: category)
  end

puts "creating post and feedback"






5.times do
  post = Post.create(
    title: Faker::Company.catch_phrase,
    description: Faker::Quote.famous_last_words,
    user: User.all.sample,
    )
    file = URI.open('https://source.unsplash.com/weekly?art')
    post.photos.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')

  1.times do

    feedback = Feedback.create(
      user: User.last,
      description: Faker::Quote.famous_last_words,
      post: post
      )
end
end

  Post.all.each do |post|
    PostCategory.create(
      category: Category.all.sample,
      post: post)
  end

puts "----------------------------------"
puts "#{Post.count} Posts created"
puts "#{User.count} Users created"
puts "#{Feedback.count} Feedback created"
puts "#{Category.count} Categories created"
puts "#{PostCategory.count} Post categories created"
puts "----------------------------------"

puts "end time is #{Time.now}"

