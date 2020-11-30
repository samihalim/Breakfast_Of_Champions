# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

Post.destroy_all
User.destroy_all
User.create(first_name: 'John', last_name: 'Smith', user_name: 'John Smith', email: 'a@a.com', password: '654321')
User.create(first_name: 'Sam', last_name: 'Bam', user_name: 'Sam Bam', email: 'bb@a.com', password: '65432134')

10.times do
  post = Post.new
  post.title = Faker::Company.catch_phrase
  post.description = Faker::Quote.famous_last_words

  post.user = User.all.sample
end

puts "#{Post.count} Posts created"
puts "#{User.count} Users created"

