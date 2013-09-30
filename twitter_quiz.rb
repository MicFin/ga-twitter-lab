require 'twitter'
require 'pry'
require 'dotenv'
Dotenv.load



client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_SECRET"]
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE




puts "What is your user name?"
user_name = gets.chomp



puts "Would you like to (1) see tweets (2) see friend's list (3) see user details or (4) see lists (5) location (6) name (7) friends count"
action = gets.chomp.downcase
me = client.user(user_name)

case action
when "1" #statuses
  # client.user(user_name.to_s) do |tweet|
  # puts tweet.text
  # end
when "2" #friends
  friend_array = []
  client.friends(user_name.to_s).each do |friend| friend_array << friend.name
  end
  friend_array.each do |friend| puts friend 
  end
when "3" #user details
 
when "4" #lists

when "5"
  puts me.location
when "6"
  puts me.name
when "7"
  puts me.friends_count
end
