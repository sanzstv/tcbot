#!/usr/bin/env ruby
#prints tweets to console for debugging and test purposes
require 'Twitter'
require_relative 'queries'
require_relative 'cache'
require 'json'
config = {
	  consumer_key: ENV['TWITTER_CKEY'],
	  consumer_secret: ENV['TWITTER_CSECRET'],
	  access_token: ENV['TWITTER_ACCESSTOKEN'],
	  access_token_secret: ENV['TWITTER_AT_SECRET']
}
client = Twitter::REST::Client.new(config)

#check to make sure we aren't going through older tweets
file = File.read('config.json')

response = JSON.parse(file)
id = response["since_id"]
text = response["text"]
puts id

search_params = {
		result_type: "recent",
		count: "1",
		lang: "en",
		since_id: id
	}

query = "unsolved"

client.search(query, search_params).each do |tweet|
	puts "Retweet id? - #{tweet.id}"

	if !tweet.retweeted_status?
		#client.retweet tweet
	end
	puts "#{tweet.user.screen_name}: #{tweet.text}"

	puts "Retweet Stat? - #{tweet.retweeted_status?}"
	id = tweet.id
	text = tweet.text
end

#CacheTweet(id, text)


