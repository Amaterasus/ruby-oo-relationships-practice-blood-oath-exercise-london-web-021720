require_relative '../config/environment.rb'
require_relative '../lib/follower.rb'
require_relative '../lib/cult.rb'
require_relative '../lib/blood_oath.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

skye = Follower.new("Skye", 26, "Death conqures all!")
ali = Follower.new("Ali", 30, "Burn Burn Burn")
dino = Follower.new("Dino", 28, "My soul is filled only with darkness")
nick = Follower.new("Nick", 25, "The whole world is burning")
sergio = Follower.new("Sergio", 28, "There will be blood!")
jo = Follower.new("Jo", 25, "Just map it >_>")
dan = Follower.new("Dan", 29, "I've got an alias for that")

ruby = Cult.new("Ruby", "Japan", 1995, "Happy programmers are deadly programmers", 12)
csharp = Cult.new("C#", "America", 2000, "My enemies will see sharp objects!", 18)
rust = Cult.new("Rust", "Internet", 2010, "Your computer will turn to rust!", 21)
python = Cult.new("Python", "Internet", 1989, "I'm going to compile you into my data set!", 34)
javascript = Cult.new("Javascript", "Netscape", 1995, "All your internet belongs to us", 5)

dan.join_cult(ruby)
jo.join_cult(ruby)
sergio.join_cult(ruby)
skye.join_cult(csharp)
skye.join_cult(javascript)
sergio.join_cult(javascript)
jo.join_cult(javascript)
ali.join_cult(javascript)
dino.join_cult(javascript)

rust.recruit_follower(sergio)
ruby.recruit_follower(skye)
python.recruit_follower(skye)
ruby.recruit_follower(dino)
ruby.recruit_follower(nick)
python.recruit_follower(dan)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
