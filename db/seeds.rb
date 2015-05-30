require_relative '../app/models/card'
require_relative '../app/models/deck'
require_relative '../app/models/guess'
require_relative '../app/models/round'
require_relative '../app/models/user'
require 'csv'

a = 1
3.times do
  User.create(username: Faker::Name.name, password: a)
  a += 1
end

deck = Deck.create(name: "Eng-Malay")

page = File.open('db/english_mal.txt')
page.each do |row|
  line = row.split(" ")
  Card.create(deck_id: deck.id, question: line[0], answer: line[1])
end

deck = Deck.create(name: "Eng-Filipino")

page = File.open('db/eng_fili')
page.each do |row|
  line = row.split(" ")
  Card.create(deck_id: deck.id, question: line[0], answer: line[1])
end



# @question = []
# @answer = []
# line_num=0
# text = File.open('/db/test.txt').read

# text.gsub!(/\r\n?/, "\n")
# text.each_line do |line|
# # print "#{line_num += 1} #{line}"
# line_num += 1

# if line_num % 3 == 1
# @question << line.chomp
# elsif line_num % 3 == 2
# @answer << line.chomp
# end
# end

# n = 0
# p = @question.length
# until n == p
# @card << Card.create(question: @question[n], answer: @answer[n])
# n += 1
# end
