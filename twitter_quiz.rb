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




puts "See who is following who for two twitter handles"
puts "Enter the first handle"
user_name = gets.chomp
puts "enter the second handle"
user_name2 = gets.chomp

begin
if (user_name.class == String) && (user_name2.class == String)
a = client.relationship(user_name, user_name2)
b = a.source
is_following = b.following
is_followed_by = b.followed_by
  if is_following && is_followed_by
    ## following and followed by
    puts "#{user_name} is following and followed by #{user_name2}"
  elsif is_following
    ## is following but not followed by
    puts "#{user_name} is following but is not followed back by #{user_name2}"
  else 
    ## is 
    puts "#{user_name} is followed by but is not following #{user_name2}"
  end
  if client.user(user_name.to_s).followers_count > client.user(user_name2.to_s).followers_count
    puts "#{user_name} is more popular"
  elsif 
    client.user(user_name.to_s).followers_count < client.user(user_name2.to_s).followers_count
    puts "#{user_name} is more popular"
  else
    puts "Both peeps are equally popular"
  end
  if client.user(user_name.to_s).friends_count < client.user(user_name.to_s).followers_count
    puts "PS #{user_name} is a twitter snob"
  end
  if client.user(user_name2.to_s).friends_count < client.user(user_name2.to_s).followers_count
    puts "PS #{user_name2} is a twitter snob"
 end
else
  client.relationship()
  end
rescue Twitter::Error::Forbidden => Error
  puts Error
end


# puts "Would you like to see your most recent friends? Of course you would! Enter how many of your most recent friends you would like to see!"

# puts "press 5 to s"
# action = gets.chomp.downcase
# me = client.user(user_name)

# case action
# when "1" #statuses
#   # client.user(user_name.to_s) do |tweet|
#   # puts tweet.text
#   # end
# when "2" #friends
#   friends_array = []
#   client.friends(user_name.to_s).each do |friend| friends_array << friend.name
#   end


# for i in 0..5
#    puts friends_array[i]
#  end


# when "3" #user details
 
# when "4" #lists

# when "5"
#   puts me.location
# when "6"
#   puts me.name
# when "7"
#   puts me.friends_count
# end
