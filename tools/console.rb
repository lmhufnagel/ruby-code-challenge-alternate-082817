require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
news = Category.new("news")
sports = Category.new("sports")

yay = Article.new("yay", "trump resigns", "www.yay.com", "lisa", "2:29", news)
hey = Article.new("hey", "cool stuff", "www.hey.com", "dillon", "8:45", sports)



binding.pry
8
