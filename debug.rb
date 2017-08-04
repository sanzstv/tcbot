#!/usr/bin/env ruby
#prints tweets to console for debugging and test purposes
require 'Twitter'
require_relative 'queries'

config = {
	  consumer_key: ENV['TWITTER_CKEY'],
	  consumer_secret: ENV['TWITTER_CSECRET'],
	  access_token: ENV['TWITTER_ACCESSTOKEN'],
	  access_token_secret: ENV['TWITTER_AT_SECRET']
}
client = Twitter::REST::Client.new(config)

search_params = {
		result_type: "popular",
		count: 1,
		lang: "en"
	}

query = "unsolved crime"
client.search(query, search_params).each do |tweet|
	client.retweet tweet
	puts "#{tweet.user.screen_name}: #{tweet.text}"
  	puts "Retweeted? - #{tweet.retweeted?}"


end
