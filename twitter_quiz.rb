require 'twitter'
require 'pry'
require 'dotenv'
Dotenv.load



# client = Twitter::REST::Client.new do |config|
#   config.consumer_key        = ENV["CONSUMER_KEY"]
#   config.consumer_secret     = ENV["CONSUMER_SECRET"]
#   config.access_token        = ENV["ACCESS_TOKEN"]
#   config.access_token_secret = ENV["ACCESS_SECRET"]
# end


client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_SECRET"]
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE


######## bieber example array and count of beliebers to 100
# topics = ["jusin", "bieber", "miley", "cyrus"]
# beliebers = []
#### not completed
# client.filter(track: topics.join(',')) do |tweet|
#   puts tweet.text
# end
#### above not completed

# client.filter(track: topics.join(',')) do |tweet|
#   if tweet.lang == "en"
#     i += 1
#     beliebers << tweet.attrs[:user][:screen_name]
#     puts "#{i} beliebers are amongst us"
#   end
#   break if i > 100
# end
# end

######### OBAMA  EXAMPLE
#filters for all tweets  with obama and then if the tweet is in english then the count 'i' goes up
#makes a hash with a key username (derived from the hash of tweet.attrs and the sub hash user) and a value tweet that is derived from the tweet.text


topic = "obama"
obama_tweets = []
i = 0

client.filter(track: topic) do |tweet|
  if tweet.lang == 'en'
    i += 1
    obama_tweets << {username: tweet.attrs[:user][:screen_name], tweet: tweet.text}
    puts "#{i} tweets gathered"
  end
  break if i >= 10
end
  # # puts each tweet with username and actual tweet
  # obama_tweets.each do |tweet_data|
  #   puts "Username: #{tweet_data[:username]}, Tweet: #{tweet_data[:tweet]}"
  # end

  # seperate each tweet by word and adds it to the words array and then flattens that array
  words = []
  words = obama_tweets.map do |tweet_data|
    tweet_data[:tweet].split(' ')
  end
  words.flatten!
  
frequencies = {}

# creates a hash of words and word counts
words.each do |word|
 frequencies[word.to_sym] ||= 0 #starts the count at 0 if no count
## Above is the same as below
 # if !frequencies[word.to_sym] == nil
 #  frequencies[word.to_sym] = 0
 #  end
 frequencies[word.to_sym] += 1 # adds 1 to count 
end
binding.pry




# puts "See who is following who for two twitter handles"
# puts "Enter your twitter handle"
# user_name = gets.chomp
# puts "enter the other handle"
# user_name2 = gets.chomp

# begin
# if (user_name.class == String) && (user_name2.class == String)
# a = client.relationship(user_name, user_name2)
# b = a.source
# is_following = b.following
# is_followed_by = b.followed_by
#   if is_following && is_followed_by
#     ## following and followed by
#     puts "#{user_name} is following and followed by #{user_name2}"
#   elsif is_following
#     ## is following but not followed by
#     puts "#{user_name} is following but is not followed back by #{user_name2}"
#     puts "Would you like to send #{user_name2} a tweet to follow you back?"
#     tweet_at = gets.chomp.downcase
#     if tweet_at == "yes"
#       ### code to tweet at name2
#     end
#   else 
#     ## is 
#     puts "#{user_name} is followed by but is not following #{user_name2}"
#     puts "Would you like to follow #{user_name2}?"
#     start_follow = gets.chomp.downcase
#     if start_follow == "yes"
#       ### code to follow name2
#     end
#   end
#   if client.user(user_name.to_s).followers_count > client.user(user_name2.to_s).followers_count
#     puts "#{user_name} is more popular"
    
#   elsif 
#     client.user(user_name.to_s).followers_count < client.user(user_name2.to_s).followers_count
#     puts "#{user_name} is more popular"
#   else
#     puts "Both peeps are equally popular"
#   end
#   if client.user(user_name.to_s).friends_count < client.user(user_name.to_s).followers_count
#     puts "PS #{user_name} is a twitter snob"
#   end
#   if client.user(user_name2.to_s).friends_count < client.user(user_name2.to_s).followers_count
#     puts "PS #{user_name2} is a twitter snob"
#  end
# else
#   client.relationship()
#   end
# rescue Twitter::Error::Forbidden => Error
#   puts Error
# end


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
