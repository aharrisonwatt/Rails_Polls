require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
users = User.create!((0...100).map {[user_name: Faker::Name.name]})
polls = Poll.create!(users.map { |user| [author: user.first, title: Faker::Company.bs]})
questions = Question.create!(polls.map { |poll| [poll: poll.first, text: Faker::Hacker.adjective]})
answer_choices = AnswerChoice.create!(questions.map { |question| [question: question.first, text: Faker::Hacker.ingverb]})

responses = Response.create!(users.map { |user| [respondent: user.first, answer_id: rand(100)]})
end


# poll = Poll.new
#
# poll.user_id = u
# poll.title = Faker::Company.bs
#
# poll.user_id => Integer
# poll.user => User
#
#
# poll.user = user
#   poll.user_id = user.id
